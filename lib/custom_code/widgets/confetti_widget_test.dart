// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports custom actions

import 'package:confetti/confetti.dart';
import 'dart:math';

class ConfettiWidgetTest extends StatefulWidget {
  const ConfettiWidgetTest({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ConfettiWidgetTestState createState() => _ConfettiWidgetTestState();
}

class _ConfettiWidgetTestState extends State<ConfettiWidgetTest> {
  late ConfettiController _centerController;

  @override
  void initState() {
    super.initState();

    // initialize confettiController
    _centerController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    // dispose the controller
    _centerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (FFAppState().isConfettiOn) {
      _centerController.play();
    }
    if (!FFAppState().isConfettiOn) {
      _centerController.stop();
    }
    return Stack(
      children: <Widget>[
        // align the confetti on the screen
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: _centerController,
            blastDirectionality: BlastDirectionality
                .explosive, // don't specify a direction, blast randomly
            // shouldLoop:
            //     true, // start again as soon as the animation is finished
            emissionFrequency: 0.1,
            numberOfParticles: 200,
            minBlastForce: 10,
            maxBlastForce: 100,
            createParticlePath: (size) {
              final path = Path();
              path.addOval(Rect.fromCircle(
                center: Offset.zero,
                radius: 3,
              ));
              return path;
            },
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ], // manually specify the colors to be used
            // createParticlePath: drawStar, // define a custom shape/path.
          ),
        ),
      ],
    );
  }
}
