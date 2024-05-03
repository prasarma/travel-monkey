import '/flutter_flow/flutter_flow_util.dart';
import 'transition_screen_widget.dart' show TransitionScreenWidget;
import 'package:flutter/material.dart';

class TransitionScreenModel extends FlutterFlowModel<TransitionScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
