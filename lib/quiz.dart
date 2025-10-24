import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  var activeScreen = 'start-screen';
  final List<String> _selectedAnswers = [];

  void startQuiz(){
    setState(() {
      activeScreen = 'questions-screen';
      _selectedAnswers.clear();
    });
  }

  void chooseAnswer(String answer){
   _selectedAnswers.add(answer);
    if(_selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      activeScreen = 'start-screen';
      _selectedAnswers.clear();
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(startQuiz);

    if(activeScreen == 'questions-screen'){
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.deepPurple.shade300,
                  Colors.indigo.shade900
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
          ),
          child: screenWidget,
        ),

      ),
    );
  }
}