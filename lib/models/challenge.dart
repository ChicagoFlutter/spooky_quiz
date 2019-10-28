import 'package:meta/meta.dart';

class Challenge {
  final String question;
  final String answer;
  final List<String> options;

  Challenge({
    @required this.question,
    @required this.answer,
    @required this.options,
  });
}
