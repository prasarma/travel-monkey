import '/flutter_flow/flutter_flow_util.dart';
import 'rating_page_widget.dart' show RatingPageWidget;
import 'package:flutter/material.dart';

class RatingPageModel extends FlutterFlowModel<RatingPageWidget> {
  ///  Local state fields for this page.

  int activeAnimationNumber = 1;

  String sadImg =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/pe7lnw7no5g7/Animation_-_3.gif';

  bool isBarrierOn = false;

  String category = 'happy';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
