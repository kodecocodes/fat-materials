import 'word.dart';
import 'package:flutter/material.dart';

class FlashCard extends StatefulWidget {
  final Word word;

  const FlashCard({super.key, required this.word});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  var isFront = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFront = !isFront;
        });
      },
      // TODO: Add card flip animation
      child: isFront ? _cardFront() : _cardBack()
    );
  }

  Widget _cardFront() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      key: const Key('front'),
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          widget.word.name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        ),),),);
  }

  Widget _cardBack() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      key: const Key('back'),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.word.definition,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18.0,
            ),),),),);
  }
}
