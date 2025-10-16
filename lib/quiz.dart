import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget{

  const Quiz({super.key});

  @override
 State <Quiz> createState() {
    return _QuizState();
  }
 }


class _QuizState extends State<Quiz>{
   Widget? activeScreen ;
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }
  void switchScreen(){
    setState(() {
      activeScreen = QuestionsScreen();
    });
  }
  @override
  Widget build(context) {
    return MaterialApp(
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
          child: activeScreen,

        ),

      ),
    );
  }
}