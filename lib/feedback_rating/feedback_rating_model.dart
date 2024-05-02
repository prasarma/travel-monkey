import '/flutter_flow/flutter_flow_util.dart';
import 'feedback_rating_widget.dart' show FeedbackRatingWidget;
import 'package:flutter/material.dart';

class FeedbackRatingModel extends FlutterFlowModel<FeedbackRatingWidget> {
  ///  Local state fields for this page.

  int activeIndex = 0;

  String category = 'sad';

  String sadImg =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/12yjasyb6ymh/Animation_-_1.gif';

  String depressedImg =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/nwlync24tbbu/Animation_-_2.gif';

  String happyImg =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/pe7lnw7no5g7/Animation_-_3.gif';

  String superHappyImg =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/l3260q5qlmi5/Animation_-_4.gif';

  String gladeImg =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ankit-travel-trip-john7v/assets/hh847wziw0mt/Animation_-_5.gif';

  String animationType = 'farword';

  bool isBarrierOn = false;

  int? activeAnimationNumber = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
