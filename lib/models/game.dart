import 'package:spooky_quiz/models/models.dart';

class Game {
  final _challenges = [
    Challenge(
      question: 'What is the name of the company hosting this event?',
      answer: 'Righpoint',
      options: [
        'Righpoint',
        'Leftpoint',
        'Centerpoint',
      ],
    ),
    Challenge(
      question: 'What is the programming language that powers Flutter?',
      answer: 'Dart',
      options: [
        'Smart',
        'Dart',
        'C++',
      ],
    ),
    Challenge(
      question: 'What is the average time of a hot reload?',
      answer: 'Less than a second',
      options: [
        '30 minutes',
        '1 day',
        'Less than a second',
      ],
    ),
  ];

  String getQuestion(int questionNumber) {
    final challenge = _challenges[questionNumber];
    return challenge.question;
  }

  List<String> getOptions(int questionNumber) {
    final challenge = _challenges[questionNumber];
    return challenge.options;
  }

  bool isValidAnswer(int questionNumber, String answer) {
    final challenge = _challenges[questionNumber];
    return challenge.answer == answer;
  }

  bool isWinner(int questionNumber) => questionNumber == _challenges.length;
}
