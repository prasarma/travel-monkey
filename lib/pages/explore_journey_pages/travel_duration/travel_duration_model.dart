import '/flutter_flow/flutter_flow_util.dart';
import 'travel_duration_widget.dart' show TravelDurationWidget;
import 'package:flutter/material.dart';

class TravelDurationModel extends FlutterFlowModel<TravelDurationWidget> {
  ///  Local state fields for this page.

  int travelPartner = 0;

  int budget = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CountController widget.
  int? countControllerValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
