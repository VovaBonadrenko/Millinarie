import 'package:flutter/material.dart';
import 'package:milioner/question_provider.dart';
import 'package:milioner/questions.dart';
import 'package:milioner/start_page.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentQuestion = context.read<QuestionProvider>().currentQuestion;
    return Scaffold(
      body: Stack(
        children: [
          Shimmer(
            duration: Duration(seconds: 7),
            interval: Duration(seconds: 1),
            color: Colors.white,
            colorOpacity: 0.5,
            direction: const ShimmerDirection.fromLTRB(),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.purple,
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Image.asset(
                    'asset/3.png',
                    height: 300,
                  ),
                ),
                Container(child:
                Text('Вітаємо!', textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 42),),),
                Container(child:
                Text('Твій умовний виграш:', textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 22),),),
                Container(child:
                Text(
                  '\$${(currentQuestion == questions.length -1 ? currentQuestion + 1 : currentQuestion) * 100}',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.yellow, fontSize: 32),),),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 60,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.read<QuestionProvider>().gameOver();
                      questions.shuffle();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const StartPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.6),
                        border: Border.all(
                          width: 2.0,
                          color: Colors.white,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            40.0,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Game over',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
