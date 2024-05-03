import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'transition_screen_model.dart';
export 'transition_screen_model.dart';

class TransitionScreenWidget extends StatefulWidget {
  const TransitionScreenWidget({super.key});

  @override
  State<TransitionScreenWidget> createState() => _TransitionScreenWidgetState();
}

class _TransitionScreenWidgetState extends State<TransitionScreenWidget> {
  late TransitionScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransitionScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: const BoxDecoration(
                color: Color(0xFFF3EBDB),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie_animations/Animation_-_1699702402169.json',
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    fit: BoxFit.cover,
                    animate: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
