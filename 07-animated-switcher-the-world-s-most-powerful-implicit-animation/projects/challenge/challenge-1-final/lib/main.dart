import 'package:flutter/foundation.dart';
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
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 190,
            height: 60,
            child: AnimatedCounter(
              counterUpdated: (value) {
                if (kDebugMode) {
                  print(value);
                }
              },
            ),),),),
    );
  }
}
