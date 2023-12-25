import 'package:flutter/material.dart';

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
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(180, 208, 203, 203), // chaging opacity
          ),
          const SizedBox(
            width: 200,
            height: 80,
          ),
          const Text(
            'Learn Flutter the funny way',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 243, 220, 220),
            ),
          ),
          const SizedBox(
            width: 200,
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Color.fromARGB(255, 242, 220, 220)),
            ),
          )
        ],
      ),
    );
  }
}
