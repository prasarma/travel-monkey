import '/flutter_flow/flutter_flow_util.dart';
import 'trip_page_widget.dart' show TripPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class TripPageModel extends FlutterFlowModel<TripPageWidget> {
  ///  Local state fields for this page.

  int selectedtab = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableExpandableController2.dispose();
  }
}
