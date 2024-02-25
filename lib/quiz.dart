import 'package:flutter/material.dart';

import 'package:quiz_ques/start_screen.dart';
import 'package:quiz_ques/question_screen.dart';
import 'package:quiz_ques/data/questions.dart';
import 'package:quiz_ques/results_screen.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}


class _QuizState extends State<Quiz>{
   List<String> _selectedAnswers =[];

var activeScreen ='start-screen';


void switchScreen(){
  setState((){
  
    activeScreen = 'question-screen';
  });
}

void chooseAnswer(String answer) {
  _selectedAnswers.add(answer);

  if (_selectedAnswers.length == questions.length){
    setState(() {
     
      activeScreen ='results-screen';
    });
}}

  @override
  Widget build (context){
    Widget screenWidget = StartScreen(switchScreen);
              if(activeScreen == 'question-screen'){
                screenWidget =  QuestionsScreen(
                  onSelectAnswer: chooseAnswer,
                  );
              }

        if (activeScreen=='results-screen') {
          screenWidget =  ResultsScreen(chosenAnswerS: _selectedAnswers,);
        }     


    return MaterialApp(
      home: Scaffold(
         body: Container(
         decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 242, 45, 31),
               Color.fromARGB(255, 242, 112, 31),
              ],
              begin:Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
         
            child:screenWidget,
          ),
            ),

        );
      
    
  }
}


  
