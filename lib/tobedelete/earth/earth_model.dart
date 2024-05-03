import '/flutter_flow/flutter_flow_util.dart';
import 'earth_widget.dart' show EarthWidget;
import 'package:flutter/material.dart';

class EarthModel extends FlutterFlowModel<EarthWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
