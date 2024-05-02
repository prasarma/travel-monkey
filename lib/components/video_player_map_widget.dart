import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'video_player_map_model.dart';
export 'video_player_map_model.dart';

class VideoPlayerMapWidget extends StatefulWidget {
  const VideoPlayerMapWidget({super.key});

  @override
  State<VideoPlayerMapWidget> createState() => _VideoPlayerMapWidgetState();
}

class _VideoPlayerMapWidgetState extends State<VideoPlayerMapWidget> {
  late VideoPlayerMapModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPlayerMapModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: FlutterFlowVideoPlayer(
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
      ],
    );
  }
}
