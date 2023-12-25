import 'package:flutter/material.dart';
import 'package:quiz_app/models/buttons.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen(this.onSelectAns, {super.key});

  final void Function(String ans) onSelectAns;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var QIndex = 0;

  void ansQuestion(String selectedAns) {
    setState(() {
      widget.onSelectAns(selectedAns);
      QIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final CurrentQuestion = questions[QIndex];
    final List<String> ShuffledAns = questions[QIndex].GetShuffledAns();
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              CurrentQuestion.question,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),

            for (var i = 0; i < CurrentQuestion.answers.length; i++) ...[
              Answer(ShuffledAns[i], () {
                ansQuestion(ShuffledAns[i]);
              }),
              const SizedBox(
                height: 15,
              )
            ]
            // ...CurrentQuestion.answers.map(                // instead of for loops, we Can also use for Map Like this
            //   (ans) {
            //     return Answer(ans, () => null);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
