import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'dance_monkey_loader_model.dart';
export 'dance_monkey_loader_model.dart';

class DanceMonkeyLoaderWidget extends StatefulWidget {
  const DanceMonkeyLoaderWidget({super.key});

  @override
  State<DanceMonkeyLoaderWidget> createState() =>
      _DanceMonkeyLoaderWidgetState();
}

class _DanceMonkeyLoaderWidgetState extends State<DanceMonkeyLoaderWidget> {
  late DanceMonkeyLoaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DanceMonkeyLoaderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => _model.lottieAnimationStatus = false);
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: const BoxDecoration(
          color: Color(0x40000000),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/images/output-onlinegiftools.gif',
                  width: 250.0,
                  fit: BoxFit.cover,
                ),
              ),
              if (false)
                Material(
                  color: Colors.transparent,
                  elevation: 100.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 0.0,
                          color: Color(0xCCFFFFFF),
                          spreadRadius: 5.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 4.0,
                      ),
                    ),
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: 184.0 * (math.pi / 180),
                    child: Lottie.asset(
                      'assets/lottie_animations/loader_lottie.json',
                      width: 255.0,
                      height: 130.0,
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
