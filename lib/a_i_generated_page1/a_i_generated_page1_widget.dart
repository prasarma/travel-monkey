import '/backend/api_requests/api_calls.dart';
import '/backend/gemini/gemini.dart';
import '/components/try_again_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'a_i_generated_page1_model.dart';
export 'a_i_generated_page1_model.dart';

class AIGeneratedPage1Widget extends StatefulWidget {
  const AIGeneratedPage1Widget({super.key});

  @override
  State<AIGeneratedPage1Widget> createState() => _AIGeneratedPage1WidgetState();
}

class _AIGeneratedPage1WidgetState extends State<AIGeneratedPage1Widget> {
  late AIGeneratedPage1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AIGeneratedPage1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.imageGet = false;
      });
      await geminiGenerateText(
        context,
        functions.createItineraryPrompt(FFAppState().generatedJson)!,
      ).then((generatedText) {
        safeSetState(() => _model.geminiResponse = generatedText);
      });

      setState(() {
        FFAppState().jsondataSample =
            functions.jsonStringToJSON(_model.geminiResponse!);
      });
      _model.leoImage = await LeonardoAPIGroup.generateImageCall.call(
        height: 512,
        width: 512,
        textPrompt:
            'Generate the realistic and beautiful image of ${FFAppState().selectedCity} place .',
      );
      if ((_model.leoImage?.succeeded ?? true)) {
        _model.imageResponse = await _model.getImageFromId(
          context,
          genId: LeonardoAPIGroup.generateImageCall.genId(
            (_model.leoImage?.jsonBody ?? ''),
          ),
        );

        context.pushNamed(
          'TripPage',
          queryParameters: {
            'cityImage': serializeParam(
              _model.imageResponse,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      } else {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: const TryAgainWidget(),
              ),
            );
          },
        ).then((value) => setState(() {}));

        return;
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Lottie.asset(
                            'assets/lottie_animations/traveller.json',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 280.0,
                            fit: BoxFit.scaleDown,
                            animate: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Text(
                          'Let\'s Go On a Holiday',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'Stay tuned! Our clever engine is busy using its magic to understand your preferences and create a personalized itinerary just for you. It might take a moment, but trust us, it is going to be super cool and worth for you. ',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '✨ Generating Itinerary',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        if (false)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                40.0, 0.0, 40.0, 80.0),
                            child: LinearPercentIndicator(
                              percent: valueOrDefault<double>(
                                _model.loading,
                                0.2,
                              ),
                              lineHeight: 20.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor: const Color(0xFF2D46F4),
                              backgroundColor: const Color(0xFFE1E8EE),
                              center: Text(
                                functions
                                    .convertDoubleToPercentage(_model.loading)!,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              barRadius: const Radius.circular(50.0),
                              padding: EdgeInsets.zero,
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
      ),
    );
  }
}
