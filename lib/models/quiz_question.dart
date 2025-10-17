class QuizQuestion {
  final String question;
  final List<String> options;
  const QuizQuestion(this.question, this.options);
  List<String> getShuffledOptions() {
    final shuffledOptions = List<String>.from(options);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }
}