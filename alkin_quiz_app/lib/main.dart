import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() => runApp(QuizApp());
class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
        child: const Text('Welcome to My Quiz Application! '
            'Alkin Sahin 200218020', textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
           ),
          ),
        ),
        Center(
        child: ElevatedButton(
          child: const Text('Start Quiz'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizPage()),
            );
          },
        ),
      ),
    ],
    ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  int questionIndex = 0;
  List<Map<String, dynamic>> questions = [    {'question': '      What is the oldest mosque in Istanbul?',
    'choices': ['Hagia Sophia', 'Suleymaniye Mosque', 'Blue Mosque', 'Mihrimah Sultan Mosque'],
    'answer': 'Hagia Sophia',
  },
    {
      'question': "        What is the largest ocean in the world?",
      'choices': ['Atlantic Ocean', 'Indian Ocean', 'Pacific Ocean', 'Arctic Ocean'],
      'answer': 'Pacific Ocean',
    },
    {
      'question': "       What is the highest mountain in Turkey?",
      'choices': ['Mount Ararat', 'Mount Erciyes', 'Mount Uludag', 'Mount Nemrut'],
      'answer': 'Mount Ararat',
    },
    {
      'question': "         Which mountain range runs along the southern coast of Turkey?",
      'choices': ['Taurus Mountains', 'Alps', 'Himalayas', 'Rocky Mountains'],
      'answer': 'Taurus Mountains',
    },
  ];

  void checkAnswer(String choice) {
    if (choice == questions[questionIndex]['answer']) {
      score+=score+25;
    }
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPage(score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${questionIndex + 1}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questions[questionIndex]['question'],
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          ...List.generate(
            4,
                (index) => ElevatedButton(
              child: Text(questions[questionIndex]['choices'][index]),
              onPressed: () {
                checkAnswer(questions[questionIndex]['choices'][index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ResultsPage extends StatelessWidget {
  final int score;

  ResultsPage(this.score);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
              if (score >= 50)
                 const Text(
                   'Congratulations!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold
                ),
              ),
            if (score < 50 && score >= 25)
              const Text(
                'well done you can be better, try again.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold
                ),
              ),
            if (score < 25)
              const Text(
                'Bad Score! Try again later',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold
                ),
              ),
          ],
        ),
      ),
    );
  }
}