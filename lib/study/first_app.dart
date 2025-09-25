import 'package:flutter/material.dart';

class MyFirstStatelessWidget extends StatelessWidget {
  final String title;

  const MyFirstStatelessWidget({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text('ola mundo'),
        ),
      ),
    );
  }
}

class MyFirstStatefulWidget extends StatefulWidget {
  final String name;

  const MyFirstStatefulWidget({super.key, this.name = ""});

  @override
  State<MyFirstStatefulWidget> createState() => _MyFirstStatefulWidgetState();
}

class _MyFirstStatefulWidgetState extends State<MyFirstStatefulWidget> {
  int salary = 1000;

  void plusSalary(int value){
    setState(() {
      salary += value;
    });
  }

  void minusSalary(int value){
    setState(() {
      salary -= value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          minusSalary(200);
        },
        child: Text(
          "O salario de ${widget.name} é $salary",
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}