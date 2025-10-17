import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
class QuestionsScreen extends StatefulWidget {
   QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }

}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];
    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                 currentQuestion.question,
                 textAlign: TextAlign.center,
                 style: const TextStyle(
                   color: Colors.white,
                 ),
              ),
              const SizedBox(height: 30),
              ...currentQuestion.options.map((answer){
                return AnswerButton(answerText: answer, onTap: (){});
              }),
            ],
        ),
      ),
    );
  }
}