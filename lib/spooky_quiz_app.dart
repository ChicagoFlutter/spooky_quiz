import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spooky_quiz/models/models.dart';
import 'package:spooky_quiz/spooky_game.dart';

class SpookyQuizApp extends StatelessWidget {
  final Game game;

  SpookyQuizApp({
    Key key,
    @required this.game,
  })  : assert(game != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('🎃 Spooky Quiz 🎃')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SpookyGame(game: game),
        ),
      ),
    );
  }
}
