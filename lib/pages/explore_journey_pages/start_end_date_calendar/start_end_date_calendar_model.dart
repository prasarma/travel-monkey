import '/flutter_flow/flutter_flow_util.dart';
import 'start_end_date_calendar_widget.dart' show StartEndDateCalendarWidget;
import 'package:flutter/material.dart';

class StartEndDateCalendarModel
    extends FlutterFlowModel<StartEndDateCalendarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
