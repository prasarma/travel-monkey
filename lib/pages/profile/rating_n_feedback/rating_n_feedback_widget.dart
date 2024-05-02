import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'rating_n_feedback_model.dart';
export 'rating_n_feedback_model.dart';

class RatingNFeedbackWidget extends StatefulWidget {
  const RatingNFeedbackWidget({super.key});

  @override
  State<RatingNFeedbackWidget> createState() => _RatingNFeedbackWidgetState();
}

class _RatingNFeedbackWidgetState extends State<RatingNFeedbackWidget> {
  late RatingNFeedbackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingNFeedbackModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent3,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 48.0,
                        icon: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_model.ratingBarValue.toString() == '4')
                            Lottie.asset(
                              'assets/lottie_animations/Animation_-_1699954437682.json',
                              height: 200.0,
                              fit: BoxFit.contain,
                              frameRate: FrameRate(60.0),
                              animate: true,
                            ),
                          if (_model.ratingBarValue.toString() == '2')
                            Lottie.asset(
                              'assets/lottie_animations/Animation_-_1699954649058.json',
                              height: 200.0,
                              fit: BoxFit.contain,
                              frameRate: FrameRate(60.0),
                              animate: true,
                            ),
                          if (_model.ratingBarValue.toString() == '5')
                            Lottie.asset(
                              'assets/lottie_animations/Animation_-_1699954684650.json',
                              height: 200.0,
                              fit: BoxFit.contain,
                              frameRate: FrameRate(60.0),
                              animate: true,
                            ),
                          if (_model.ratingBarValue.toString() == '1')
                            Lottie.asset(
                              'assets/lottie_animations/Animation_-_1699954807028.json',
                              height: 200.0,
                              fit: BoxFit.contain,
                              frameRate: FrameRate(60.0),
                              animate: true,
                            ),
                          if (_model.ratingBarValue.toString() == '3')
                            Lottie.asset(
                              'assets/lottie_animations/Animation_-_1699954941600.json',
                              height: 200.0,
                              fit: BoxFit.contain,
                              frameRate: FrameRate(60.0),
                              animate: true,
                            ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Text(
                          'HOW WAS YOUR EXPERIENCE?',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_model.ratingBarValue.toString() == '1')
                              Text(
                                'Hilarious!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).warning,
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            if (_model.ratingBarValue.toString() == '2')
                              Text(
                                'It\'s Bad!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).warning,
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            if (_model.ratingBarValue.toString() == '3')
                              Text(
                                'It\'s Ok!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).warning,
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            if (_model.ratingBarValue.toString() == '4')
                              Text(
                                'It\'s Good!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).warning,
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            if (_model.ratingBarValue.toString() == '5')
                              Text(
                                'It\'s Amazing',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).warning,
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                        child: RatingBar.builder(
                          onRatingUpdate: (newValue) =>
                              setState(() => _model.ratingBarValue = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: FlutterFlowTheme.of(context).warning,
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBarValue ??= 5.0,
                          unratedColor: const Color(0xFFD5D7DA),
                          itemCount: 5,
                          itemSize: 60.0,
                          glowColor: FlutterFlowTheme.of(context).warning,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Feedback Submitted Successfully.',
                                      style: GoogleFonts.getFont(
                                        'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );

                                context.pushNamed(
                                  'CustomNavbar',
                                  queryParameters: {
                                    'currentIndex': serializeParam(
                                      2,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Done',
                              options: FFButtonOptions(
                                width: 100.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
