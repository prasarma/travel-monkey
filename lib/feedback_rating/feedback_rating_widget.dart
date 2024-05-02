import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'feedback_rating_model.dart';
export 'feedback_rating_model.dart';

class FeedbackRatingWidget extends StatefulWidget {
  const FeedbackRatingWidget({super.key});

  @override
  State<FeedbackRatingWidget> createState() => _FeedbackRatingWidgetState();
}

class _FeedbackRatingWidgetState extends State<FeedbackRatingWidget> {
  late FeedbackRatingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackRatingModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
