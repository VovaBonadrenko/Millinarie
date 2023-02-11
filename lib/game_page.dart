import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:milioner/game_over_page.dart';
import 'package:milioner/question_provider.dart';
import 'package:milioner/questions.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentQuestion = context.watch<QuestionProvider>().currentQuestion;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Shimmer(
            duration: const Duration(seconds: 10),
            colorOpacity: 0.2,
            direction: const ShimmerDirection.fromLTRB(),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.purple],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                'Рахунок: $currentQuestion',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: FlipCard(
                    direction: FlipDirection.VERTICAL,
                    front: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2.0),
                          color: Colors.purple.withOpacity(0.2)),
                      child: Center(
                        child: Text(
                          questions[currentQuestion].question,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white,width: 2.0),
                          color: Colors.purple.withOpacity(0.2)),
                      child: Center(
                        child: Text(
                          questions[currentQuestion].hint,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    AnswersColumn(
                      columnNumber: 1,
                      currentQuestion: currentQuestion,
                    ),
                    AnswersColumn(
                      columnNumber: 2,
                      currentQuestion: currentQuestion,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnswersColumn extends StatelessWidget {
  final int columnNumber;
  final int currentQuestion;
  const AnswersColumn({
    Key? key,
    required this.columnNumber,
    required this.currentQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Answer(
            title: columnNumber == 1
                ? 'A: ${questions[currentQuestion].answers[0]}'
                : 'B: ${questions[currentQuestion].answers[1]}',
            isCorrect: columnNumber == 1
                ? questions[currentQuestion].correctAnswerIndex == 0
                : questions[currentQuestion].correctAnswerIndex == 1,
          ),
          Answer(
            title: columnNumber == 1
                ? 'C: ${questions[currentQuestion].answers[2]}'
                : 'D: ${questions[currentQuestion].answers[3]}',
            isCorrect: columnNumber == 1
                ? questions[currentQuestion].correctAnswerIndex == 2
                : questions[currentQuestion].correctAnswerIndex == 3,
          ),
        ],
      ),
    );
  }
}

class Answer extends StatefulWidget {
  final String title;
  final bool isCorrect;
  const Answer({
    Key? key,
    required this.title,
    required this.isCorrect,
  }) : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  Color buttonColor = Colors.blueGrey.withOpacity(0.6);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3,
            vertical: 4),
        child: GestureDetector(
          onTap: () {
            final provider = context.read<QuestionProvider>();
            setState(() {
              buttonColor = Colors.black;
            });
            Timer(const Duration(seconds: 1), () {
              setState(() {
                buttonColor = widget.isCorrect ? Colors.green : Colors.red;
              });
              Timer(const Duration(seconds: 1), () {
                if (widget.isCorrect) {
                  if (provider.currentQuestion < questions.length - 1) {
                    provider.goNext();
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const GameOverPage(),
                      ),
                    );
                  }
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GameOverPage(),

                    ),
                  );
                }
                setState(() {
                  buttonColor = Colors.blueGrey.withOpacity(0.6);
                });
              });
            });
          },
          child: AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white,width: 2.0),
              color: buttonColor,
            ),
            duration: const Duration(milliseconds: 300),
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(color: Colors.white, fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
