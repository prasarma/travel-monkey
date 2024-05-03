import '/flutter_flow/flutter_flow_util.dart';
import 'rating_n_feedback_widget.dart' show RatingNFeedbackWidget;
import 'package:flutter/material.dart';

class RatingNFeedbackModel extends FlutterFlowModel<RatingNFeedbackWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
