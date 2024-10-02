import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // This list will store the score icons (checkmark or cross)
  List<Widget> scoreKeeper = [];

  // List of questions
  List<String> questions = [
    'The sky is blue.',
    'Cats are mammals.',
    'Flutter is a programming language.',
    'The Earth is flat.',
    'She ís beautiful',
    'I love you',
    'hmm. moa moaaaaaa',
    'Mèo con dễ thương'
  ];

  // Current question index
  int questionIndex = 0;

  // Method to check the answer and update the question
  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      // Update the scoreKeeper based on the user's answer
      if (userPickedAnswer == true) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      // Move to the next question
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else {
        // If it's the last question, reset the quiz
        questionIndex = 0;
        scoreKeeper.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionIndex], // Display the current question
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              child: Text('True'),
              onPressed: () {
                // The user picked true
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              child: Text('False'),
              onPressed: () {
                // The user picked false
                checkAnswer(false);
              },
            ),
          ),
        ),
        // Row to display the scorekeeper (icons)
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
