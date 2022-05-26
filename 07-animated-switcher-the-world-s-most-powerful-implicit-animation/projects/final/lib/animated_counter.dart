import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final void Function(int) counterUpdated;
  const AnimatedCounter({super.key, required this.counterUpdated});

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> {
  var currentCounter = 0;

  void increment() {
    setState(() {
      currentCounter++;
      widget.counterUpdated(currentCounter);
    });
  }

  void decrement() {
    setState(() {
      currentCounter--;
      widget.counterUpdated(currentCounter);
    });
  }

  final elevationStyle = ElevatedButton.styleFrom(
    elevation: 0.0,
    shape: const CircleBorder(),
    padding: const EdgeInsets.all(8),
    primary: Colors.white,
    onPrimary: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [mainCounter(), bubbleIndicator()],
    );
  }

  Widget bubbleIndicator() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1200),
      switchInCurve: Curves.easeInOutBack,
      switchOutCurve: Curves.easeInOutBack,
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          children: [
            if (currentChild != null) currentChild,
          ],
        );
      },
      transitionBuilder: (Widget child, Animation<double> animation) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, -1.2),
          end: const Offset(0.0, -2.0))
          .animate(animation);

        final scaleFadeOutAnimation = Tween<double>(
          begin: 1.0, 
          end: 0.0)
          .animate(animation);

        return ScaleTransition(
          scale: scaleFadeOutAnimation,
          child: FadeTransition(
              opacity: scaleFadeOutAnimation,
              child: SlideTransition(
                position: offsetAnimation, 
                child: child)),
        );
      },
      child: Container(
        key: ValueKey<int>(currentCounter),
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text('$currentCounter',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 24)),
        ),
      ),
    );
  }

  Widget mainCounter() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ElevatedButton(
          style: elevationStyle,
          onPressed: decrement,
          child:
              Icon(Icons.remove, color: Theme.of(context).colorScheme.primary),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          switchInCurve: Curves.bounceInOut,
          switchOutCurve: Curves.bounceInOut,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
                opacity: animation,
                child: ScaleTransition(scale: animation, child: child));
          },
          child: Text('$currentCounter',
              key: ValueKey<int>(currentCounter),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 24)),
        ),
        ElevatedButton(
          style: elevationStyle,
          onPressed: increment,
          child: Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
        )
      ]),
    );
  }
}
