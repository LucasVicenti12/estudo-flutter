import 'dart:math';

import 'package:flutter/material.dart';

class RandomButtonRefactor extends StatefulWidget {
  const RandomButtonRefactor({super.key});

  @override
  State<RandomButtonRefactor> createState() => _RandomButtonRefactorState();
}

enum GameState { win, gameOver, playing }

class _RandomButtonRefactorState extends State<RandomButtonRefactor> {
  GameState state = GameState.playing;

  int attempts = 0;
  int value = Random().nextInt(2);

  void start() {
    setState(() {
      state = GameState.playing;
      attempts = 0;
      value = Random().nextInt(2);
    });
  }

  void tryAttempt(int option) {
    setState(() {
      if (option == value) {
        state = GameState.win;
      } else {
        if (attempts > 0) {
          state = GameState.gameOver;
        } else {
          attempts++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      GameState.win => _WinWidget(start: start),
      GameState.gameOver => _GameOverWidget(start: start),
      GameState.playing =>
        _PlayingWidget(tryAttempt: tryAttempt, attempts: attempts),
    };
  }
}

abstract class _FinalViewWidget extends StatelessWidget {
  final void Function() start;

  const _FinalViewWidget({required this.start});
}

class _WinWidget extends _FinalViewWidget {
  const _WinWidget({required super.start});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You win!!",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            OutlinedButton(
              onPressed: start,
              child: Text(
                "Start again",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GameOverWidget extends _FinalViewWidget {
  const _GameOverWidget({required super.start});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Game over!!",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            OutlinedButton(
              onPressed: start,
              child: Text(
                "Try again",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlayingWidget extends StatelessWidget {
  final void Function(int i) tryAttempt;
  final int attempts;

  const _PlayingWidget({required this.tryAttempt, required this.attempts});

  @override
  Widget build(BuildContext context) {
    final buttons = List.generate(
      3,
      (i) => OutlinedButton(
        onPressed: () {
          tryAttempt(i);
        },
        child: Text(
          "Clique here",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select one of options",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              "Attempts: $attempts",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            ...buttons,
          ],
        ),
      ),
    );
  }
}
