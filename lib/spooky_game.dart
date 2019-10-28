import 'package:flutter/material.dart';
import 'package:spooky_quiz/models/game.dart';

class SpookyGame extends StatefulWidget {
  final Game game;

  SpookyGame({
    Key key,
    @required this.game,
  })  : assert(game != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SpookyGame();
}

class _SpookyGame extends State<SpookyGame> {
  var questionNumber = 0;
  var isWinner = false;
  var isValidAnswer = false;
  var selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isWinner
          ? Column(
              key: Key('winner_column'),
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 150),
                Text(
                  'You are the winner!',
                  style: TextStyle(fontSize: 40),
                ),
                RaisedButton(
                  child: Text('Reset Game'),
                  onPressed: () {
                    setState(() {
                      questionNumber = 0;
                      isWinner = false;
                      isValidAnswer = false;
                      selectedAnswer = null;
                    });
                  },
                ),
              ],
            )
          : Column(
              key: Key('challenge_column'),
              children: [
                Text(
                  widget.game.getQuestion(questionNumber),
                  key: Key('question_text'),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                for (var option in widget.game.getOptions(questionNumber))
                  Row(
                    children: <Widget>[
                      Radio(
                        key: Key('radio_${option}_button'),
                        value: option,
                        groupValue: selectedAnswer,
                        onChanged: (selectedOption) {
                          final result = widget.game.isValidAnswer(
                            questionNumber,
                            selectedOption,
                          );
                          setState(() {
                            selectedAnswer = selectedOption;
                            isValidAnswer = result;
                          });
                        },
                      ),
                      Text(
                        option,
                        key: Key('radio_${option}_text'),
                      ),
                    ],
                  ),
                if (isValidAnswer)
                  RaisedButton(
                    key: Key('nextQuestion_button'),
                    child: Text('Correct! Next question!'),
                    onPressed: () {
                      setState(() {
                        questionNumber++;
                        if (widget.game.isWinner(questionNumber)) {
                          isWinner = true;
                        } else {
                          isValidAnswer = false;
                          selectedAnswer = null;
                        }
                      });
                    },
                  ),
              ],
            ),
    );
  }
}
