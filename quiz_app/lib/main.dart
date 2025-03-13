import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quiz()
    );
  }

}
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int groupValue = 2;
  int currentQuestion = 0;
  Color answerColor = Colors.transparent;
  //questions[currentQuestion]
  int score = 0;

  var questions = ['Question 1', 'Question 2', 'Question 3'];
  var answers = [0,0,1];
  String result = "";
  //Class methods
  void checkAnswer(int answer){
    print('User answered $answer');

    if(answers[currentQuestion] == answer){
      print("Correct");
      answerColor = Colors.green;
      score++;
      result = "Correct!";
    } else{
      print("Incorrect");
      answerColor = Colors.red;
      result = "Incorrect!";
    }
    //if answer is true or false, set the score and show the result correct/incorrect
    //Set the groupValue
    setState(() {
      groupValue = answer;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Quiz App", style: TextStyle(fontSize: 22)),
        centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(36.6),
          child: Column(
            children: <Widget>[
              Text(
                questions[currentQuestion],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white)
                
                ),
              SizedBox(height: 30,),
              Row(children: <Widget>[
                Radio(value: 1, groupValue: groupValue, onChanged: (e)=>{checkAnswer(e!)}),
                Text("True", style: TextStyle(fontSize: 14, color: Colors.white)),
                Radio(value: 0, groupValue: groupValue, onChanged: (e)=>{checkAnswer(e!)}),
                Text("False", style: TextStyle(fontSize: 14, color: Colors.white)),
              ],),
             TextButton(
              onPressed: () {
                setState(() {
                  if (currentQuestion < questions.length - 1) {
                    currentQuestion++;
                  } else {
                    //Reset to first question
                    currentQuestion = 0; 
                    //Reset Score
                    score = 0; 
                  }
                  groupValue = 2;
                  result = "";
                });
              },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ), 
              child: Text("Next")),
              SizedBox(height: 30,),
              Text(
                result,
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                backgroundColor: answerColor,
                )
                ),
              SizedBox(height: 30),
              Text(
                "Score: $score",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),

                ),

            ],
            
          ),
          )
      );
     
  }
}

