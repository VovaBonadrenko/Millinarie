import 'package:flutter/material.dart';

class QuestionProvider extends ChangeNotifier {
  int _currentQuestion = 0;

  int get currentQuestion => _currentQuestion;

  void goNext() {
    _currentQuestion++;
    notifyListeners();
  }

  void gameOver() {
    _currentQuestion = 0;
    notifyListeners();
  }
}
