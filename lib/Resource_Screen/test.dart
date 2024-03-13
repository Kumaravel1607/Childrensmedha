import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';

class MCQTestPage extends StatefulWidget {
  @override
  _MCQTestPageState createState() => _MCQTestPageState();
}

class _MCQTestPageState extends State<MCQTestPage> {
  // List of questions and their respective options
  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Berlin', 'Madrid', 'Paris', 'Rome'],
      'correctAnswer': 'Paris',
    },
    {
      'question': 'Which programming language is Flutter built with?',
      'options': ['Java', 'Dart', 'Swift', 'Kotlin'],
      'correctAnswer': 'Dart',
    },
    {
      'question': ' Flutter is Developed by ?',
      'options': ['Google', 'Facebook', 'Amazon', 'Apple'],
      'correctAnswer': 'Google', // Correct answer fixed
    },
    // Add more questions as needed
  ];

  int currentQuestionIndex = 0;
  String selectedAnswer = '';
  int score = 0;

  bool showFeedback = false;
  bool showNextQuestionButton = false;

  void checkAnswer() {
    String correctAnswer = questions[currentQuestionIndex]['correctAnswer'];
    if (selectedAnswer == correctAnswer) {
      setState(() {
        score++;
      });
    }
    setState(() {
      showFeedback = true;
      showNextQuestionButton = true;
      selectedAnswer = '';
    });
  }

  void nextQuestion() {
    setState(() {
      showFeedback = false;
      showNextQuestionButton = false;
    });
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      print('Quiz completed! Score: $score/${questions.length}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Blue,
        automaticallyImplyLeading: false,
        shadowColor: black,
        title: text20('Practice Test', white),
        elevation: 3,
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left_outlined,
            size: 30,
            color: white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(
                questions[currentQuestionIndex]['options'].length,
                (index) => RadioListTile(
                  activeColor: Blue,
                  title:
                      Text(questions[currentQuestionIndex]['options'][index]),
                  value: questions[currentQuestionIndex]['options'][index],
                  groupValue: selectedAnswer,
                  onChanged: (value) {
                    setState(() {
                      selectedAnswer = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                checkAnswer();
              },
              child: Text(
                'Submit Answer',
                style: TextStyle(
                    color: Blue, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 20),
            if (showFeedback)
              Text(
                'Correct Answer: ${questions[currentQuestionIndex]['correctAnswer']}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 20),
            if (showNextQuestionButton)
              ElevatedButton(
                onPressed: () {
                  nextQuestion();
                },
                child: Text(
                  'Next Question',
                  style: TextStyle(
                      color: Blue, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
