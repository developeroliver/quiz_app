import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/questions_page.dart';
import 'package:quiz_app/pages/results_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var _activePage = "home-page";

  void switchScreen() {
    setState(() {
      _activePage = "questions-page";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        _activePage = 'results-page';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      _activePage = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget pageWidget = HomePage(switchScreen);

    if (_activePage == 'questions-page') {
      pageWidget = QuestionsPage(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (_activePage == 'results-page') {
      pageWidget = ResultsPage(
        chosenAnswers: selectedAnswers,
         onRestart: restartQuiz,
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.deepPurple,
              Colors.purpleAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: pageWidget,
      ),
    );
  }
}
