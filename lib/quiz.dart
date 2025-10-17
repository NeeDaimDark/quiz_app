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
 var activeScreen = 'start-screen';


  void switchScreen(){
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen == 'questions-screen'){
      screenWidget = QuestionsScreen();
    }

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
          child: screenWidget,
        ),

      ),
    );
  }
}