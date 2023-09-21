import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: Colors.white.withOpacity(0.6),
          ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 245, 216, 216),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
