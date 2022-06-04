import 'word.dart';
import 'package:flutter/material.dart';
import 'flashcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 7 Challenge 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Challenge2(title: 'Chapter 7 Challenge 2'),
    );
  }
}

class Challenge2 extends StatefulWidget {
  const Challenge2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Challenge2> createState() => _Challenge2State();
}

class _Challenge2State extends State<Challenge2> {
  @override
  Widget build(BuildContext context) {
    final word = Word(
      name: 'Flutter', 
      definition: '''Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.''');

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: SizedBox(
              height: 300, 
              width: 400, 
              child: FlashCard(
                word: word))));
  }
}
