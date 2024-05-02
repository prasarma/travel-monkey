import '/components/dance_monkey_loader_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trip_details_widget.dart' show TripDetailsWidget;
import 'package:flutter/material.dart';

class TripDetailsModel extends FlutterFlowModel<TripDetailsWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  String response = 'NA';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Gemini - Text From Image] action in TripDetails widget.
  String? aiImageResponse;
  // Stores action output result for [Gemini - Generate Text] action in TripDetails widget.
  String? aiTextResponse;
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
