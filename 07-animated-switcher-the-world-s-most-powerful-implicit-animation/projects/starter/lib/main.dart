import 'package:flutter/material.dart';
import 'animated_counter.dart';

void main() {
  runApp(const AnimatedSwitcherExample());
}

class AnimatedSwitcherExample extends StatelessWidget {
  const AnimatedSwitcherExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Switcher Example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Scaffold(
        body: Center(child: AnimatedCounter())),
    );
  }
}
