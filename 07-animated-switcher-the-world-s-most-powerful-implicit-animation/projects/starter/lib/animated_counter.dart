import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final void Function(int) counterUpdated;
  const AnimatedCounter({super.key, required this.counterUpdated});

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> {
  // TODO: Add state properties
  // TODO: Add button styling
  
  @override
  Widget build(BuildContext context) {
    // TODO: Wrap in a stack widget
    return mainCounter();
  }

  Widget mainCounter() {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        // TODO: Add counter's main components
        child: const Center(child: Text('Animated Counter')));
  }

  Widget bubbleIndicator() {
    // TODO: Add bubble count indicator
    throw UnimplementedError();
  }
}
