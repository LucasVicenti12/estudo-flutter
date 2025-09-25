import 'dart:math';

import 'package:flutter/material.dart';

class ChangeColorButton extends StatefulWidget {
  const ChangeColorButton({super.key});

  @override
  State<ChangeColorButton> createState() => _ChangeColorButtonState();
}

class _ChangeColorButtonState extends State<ChangeColorButton> {
  Color color = Colors.blue;

  Color randomColor() {
    final String r = Random().nextInt(256).toRadixString(16).padLeft(2);
    final String g = Random().nextInt(256).toRadixString(16).padLeft(2);
    final String b = Random().nextInt(256).toRadixString(16).padLeft(2);

    return Color(int.parse('0xFF$r$g$b'));
  }

  void changeColor() {
    setState(() {
      color = randomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(color),
          ),
          onPressed: () {
            changeColor();
          },
          child: Text(
            "Alterar a cor",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
