import 'dart:math';

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
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          final rotate = Tween(begin: pi, end: 0.0).animate(animation);
          return AnimatedBuilder(
            animation: rotate,
            child: child,
            builder: (context, child) {
              final angle = (const Key('front') != widget.key)
                  ? min(rotate.value, pi / 2)
                  : rotate.value;
              return Transform(
                transform: Matrix4.rotationX(angle),
                alignment: Alignment.center,
                child: child,
              );
            });
      },
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: isFront ? _cardFront() : _cardBack(),
      ),
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
