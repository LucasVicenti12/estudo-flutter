import 'dart:math';

import 'package:flutter/material.dart';

class RandomButton extends StatefulWidget {
  const RandomButton({super.key});

  @override
  State<RandomButton> createState() => _RandomButtonState();
}

class _RandomButtonState extends State<RandomButton> {
  int value = Random().nextInt(2);
  Color background = Colors.black;
  String? message;

  int attempts = 0;

  void resetButton() {
    setState(() {
      value = Random().nextInt(2);
      background = Colors.black;
      message = null;
      attempts = 0;
    });
  }

  void verifyAttempts(int option) {
    if (option == value) {
      setState(() {
        background = Colors.lightGreen;
        message = "Você ganhou!!!";
      });
    } else {
      if (attempts > 0) {
        setState(() {
          background = Colors.redAccent;
          message = "Você perdeu!!!";
        });
      } else {
        setState(() {
          attempts += 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = List.generate(
      3,
      (i) => OutlinedButton(
        onPressed: () {
          verifyAttempts(i);
        },
        child: Text(
          "Clique aqui",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              ...elements,
              SizedBox(
                height: 12,
              ),
              OutlinedButton(
                onPressed: resetButton,
                child: Text(
                  "Alterar botão",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              if (message != null)
                Text(
                  message!,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
