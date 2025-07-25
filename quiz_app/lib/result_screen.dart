import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary.dart';
import 'package:quiz_app/datas/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,
   required this.choosenAnswers,
   required this.onRestart,
   });

   final List<String> choosenAnswers;
   final void Function() onRestart;
   
List<Map<String, Object>> getSummaryData() {
  final List<Map<String, Object>> summary = [];
  
  for (var i = 0; i < choosenAnswers.length; i++) {
    summary.add({
      'question_index': i,
      'question': questions[i].text,
      'correct_answer': questions[i].answers[0],
      'user_answer': choosenAnswers[i],
    });
  }

  return summary;
}


  @override
  Widget build(BuildContext context) {

   final summaryData = getSummaryData();
   final numTotalQuestions = questions.length;
   final numCorrectQuestions = summaryData.where((data) {
     return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions question correctly!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'List of answer and question',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 30
              ),
           QuestionsSummary(getSummaryData()),
          const SizedBox(
           height: 30,
            ),
            TextButton(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white
              ),
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
