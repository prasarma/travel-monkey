import '/flutter_flow/flutter_flow_util.dart';
import 'call_custom_itinerary_page_widget.dart'
    show CallCustomItineraryPageWidget;
import 'package:flutter/material.dart';

class CallCustomItineraryPageModel
    extends FlutterFlowModel<CallCustomItineraryPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
