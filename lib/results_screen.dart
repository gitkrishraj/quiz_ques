import 'package:flutter/material.dart';
import 'package:quiz_ques/data/questions.dart';
import 'package:quiz_ques/questions_summary.dart';

 class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswerS,
    });



  final List<String> chosenAnswerS;

  List<Map<String, Object>> get summaryData{
    final List<Map<String, Object>> summary =[];
    for(var i =0; i < chosenAnswerS.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
         'correct_answer' :questions[i].answers[0],
         'user_answer': chosenAnswerS[i]
      },
      );
    }

    return summary;
  }



  @override
  Widget build (BuildContext context){
    
   final numTotalQuestions =questions.length;
   final numCorrectQuestions =summaryData
   .where( 
        ( data) => data['user_answer'] ==data['correct_answer'],
   )
   .length;


    return  SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [ 
            Text ('You answered $numCorrectQuestions out of  $numTotalQuestions question correctly!'
            ),
           const SizedBox(
            height: 30,
           ),
           QuestionsSummary(summaryData),

          
           const SizedBox(
            height: 30,
           ),
            TextButton(
              onPressed: (){},
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}