import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'call_custom_itinerary_page_model.dart';
export 'call_custom_itinerary_page_model.dart';

class CallCustomItineraryPageWidget extends StatefulWidget {
  const CallCustomItineraryPageWidget({super.key});

  @override
  State<CallCustomItineraryPageWidget> createState() =>
      _CallCustomItineraryPageWidgetState();
}

class _CallCustomItineraryPageWidgetState
    extends State<CallCustomItineraryPageWidget> {
  late CallCustomItineraryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallCustomItineraryPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: custom_widgets.ItineraryPageWidget(
            width: double.infinity,
            height: double.infinity,
            numberOfDays: FFAppState().TimeDuration,
            companionship: FFAppState().companion,
            startDate: FFAppState().selectedStartDate,
            tripJson: functions.trimTripData(
                FFAppState().tripDetails, FFAppState().TimeDuration),
          ),
        ),
      ),
    );
  }
}
