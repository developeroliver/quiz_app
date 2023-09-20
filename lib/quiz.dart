import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/questions_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activePage = "home-page";

  void switchScreen() {
    setState(() {
      activePage = "questions-page";
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageWidget = activePage == "home-page"
            ? HomePage(switchScreen)
            : const QuestionsPage();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.purpleAccent,
              Colors.deepPurple,
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
