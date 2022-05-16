/*
Copyright (c) 2022 Razeware LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
distribute, sublicense, create a derivative work, and/or sell copies of the
Software in any work that is designed, intended, or marketed for pedagogical or
instructional purposes related to programming, coding, application development,
or information technology.  Permission for such use, copying, modification,
merger, publication, distribution, sublicensing, creation of derivative works,
or sale is expressly withheld.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

import 'dart:async';

import 'package:flutter/material.dart';

import 'ball.dart';

class BouncyBallAnimation extends StatefulWidget {
  const BouncyBallAnimation({super.key});

  @override
  State createState() => _BouncyBallAnimationState();
}

class _BouncyBallAnimationState extends State<BouncyBallAnimation> {
  double ballPosition = -1;
  int direction = 1;
  double squash = 1;

  late final Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 16), _onTick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bouncy Ball!'),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, ballPosition),
              child: Transform.scale(
                scaleX: squash,
                child: Transform.rotate(
                  angle: ballPosition,
                  child: const Ball(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTick(Timer timer) {
    ballPosition += 0.03 * direction;
    if (ballPosition >= 1) {
      direction = -1;
    } else if (ballPosition <= -1) {
      direction = 1;
    }

    if (ballPosition >= 0.75) {
      squash += 0.08 * direction;
    } else {
      squash = 1;
    }

    setState(() {});
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
