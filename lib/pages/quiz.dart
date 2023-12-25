import 'package:flutter/material.dart';
import 'package:quiz_app/pages/homeP.dart';
import 'package:quiz_app/pages/QuestionP.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/resultsP.dart';

class Quiz extends StatefulWidget {
  Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? currentScreen;

  List<String> selectedAns = []; //for Storing all the answers selected by user.

  void choosenAns(String ans) {
    selectedAns.add(ans);

    if (selectedAns.length == questions.length) {
      setState(() {
        currentScreen = ResultScreen(selectedAns,RetakeQuiz);
      });
    }
  }

  void RetakeQuiz() {
    setState(() {
      selectedAns = [];
      currentScreen = QuestionScreen(choosenAns);
    });
  }

  @override
  void initState() {
    // Instead of the init state , we can also use Terinary expressions by changing the values in 'OnPressed'
    currentScreen = HomePage(switchToQuestionP);
    super.initState();
  }

  void switchToQuestionP() {
    setState(() {
      currentScreen = QuestionScreen(choosenAns);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
