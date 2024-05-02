import '/flutter_flow/flutter_flow_util.dart';
import 'custom_navbar_widget.dart' show CustomNavbarWidget;
import 'package:flutter/material.dart';

class CustomNavbarModel extends FlutterFlowModel<CustomNavbarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
