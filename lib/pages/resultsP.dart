import 'package:quiz_app/pages/quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questionSummary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, this.onClick, {super.key});

  final List<String> chosenAnswers;
  final Function() onClick;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'Question_Index': i,
          'Question': questions[i].question,
          'Correct_Ans': questions[i].answers[0],
          'User_Ans': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final total = questions.length;
    final correct = summaryData.where((data) {
      return data['Correct_Ans'] == data['User_Ans'];
    }).length;

    return Column(children: [
      SizedBox(
        height: 500,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start, 
                  children: [
              Text(
                'You have answered $correct out of $total Questions correctly ',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Color.fromARGB(255, 201, 153, 251),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              QuestionSummary(getSummary()),
              const SizedBox(
                height: 5,
              ),
            ]),
          ),
        ),
      ),
      OutlinedButton.icon(
          icon: const Icon(Icons.arrow_circle_left),
          onPressed: onClick,
          label: const Text(
            'Retake Quiz',
            style: TextStyle(
              color: Color.fromARGB(255, 201, 153, 251),
            ),
          ))
    ]);
  }
}
