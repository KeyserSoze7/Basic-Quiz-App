class QuizQuestions {
  const QuizQuestions(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> GetShuffledAns() {
    final shuffled = List.of(answers);   // Creating another list of answers as shuffle permenently shuffles the list 
    shuffled.shuffle();
    return shuffled;
  }
}
