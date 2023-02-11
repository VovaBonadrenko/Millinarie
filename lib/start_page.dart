import 'package:flutter/material.dart';
import 'package:milioner/questions.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'game_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Shimmer(
            duration: Duration(seconds: 8),
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
                  padding:  EdgeInsets.symmetric(vertical: 50,
                  horizontal: 20),
                  child: Image.asset(
                    'asset/2.png',
                    height: 300,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 90,
                    horizontal: 50
                  ),
                  child: GestureDetector(
                    onTap: () {
                      questions.shuffle();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const GamePage()
                        ),
                      );
                    },
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.5),
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
                          'Start',
                          style: TextStyle(
                            fontSize: 50,
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
