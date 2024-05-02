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

import 'package:travel_monkey/flutter_flow/flutter_flow_video_player.dart';

import 'index.dart'; // Imports other custom widgets

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // mainAxisSize: MainAxisSize.max,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        child: const FlutterFlowVideoPlayer(
          path: 'assets/videos/181273_(Original).mp4',
          videoType: VideoType.asset,
          width: double.infinity,
          height: double.infinity,
          autoPlay: true,
          looping: true,
          showControls: false,
          allowFullScreen: true,
          allowPlaybackSpeedMenu: false,
        ),
      ),
    );
  }
}
