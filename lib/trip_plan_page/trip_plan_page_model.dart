import '/components/dance_monkey_loader_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trip_plan_page_widget.dart' show TripPlanPageWidget;
import 'package:flutter/material.dart';

class TripPlanPageModel extends FlutterFlowModel<TripPlanPageWidget> {
  ///  Local state fields for this page.

  bool showTransition = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for danceMonkeyLoader component.
  late DanceMonkeyLoaderModel danceMonkeyLoaderModel;

  @override
  void initState(BuildContext context) {
    danceMonkeyLoaderModel =
        createModel(context, () => DanceMonkeyLoaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    danceMonkeyLoaderModel.dispose();
  }
}
