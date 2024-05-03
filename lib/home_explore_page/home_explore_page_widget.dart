import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dance_monkey_loader_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tobedelete/favorites_card/favorites_card_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'home_explore_page_model.dart';
export 'home_explore_page_model.dart';

class HomeExplorePageWidget extends StatefulWidget {
  const HomeExplorePageWidget({super.key});

  @override
  State<HomeExplorePageWidget> createState() => _HomeExplorePageWidgetState();
}

class _HomeExplorePageWidgetState extends State<HomeExplorePageWidget> {
  late HomeExplorePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeExplorePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TravelDataRecord>>(
      stream: queryTravelDataRecord(
        queryBuilder: (travelDataRecord) => travelDataRecord
            .where(
              'userRef',
              isEqualTo: currentUserReference,
            )
            .orderBy('created_at', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<TravelDataRecord> homeExplorePageTravelDataRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Builder(
                builder: (context) {
                  if (homeExplorePageTravelDataRecordList.isEmpty) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.add,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed(
                                                      'ChooseLocationPage');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: 380.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -0.39, 0.0),
                                                          child: Container(
                                                            width: 35.0,
                                                            height: 35.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .airplanemode_active,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -0.25, 0.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                                const CircleBorder(),
                                                            child: Container(
                                                              width: 35.0,
                                                              height: 35.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0xFFEF9239),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .king_bed_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -0.1, 0.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                                const CircleBorder(),
                                                            child: Container(
                                                              width: 35.0,
                                                              height: 35.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0xFFC540D5),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons.luggage,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.06, 0.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                                const CircleBorder(),
                                                            child: Container(
                                                              width: 35.0,
                                                              height: 35.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0xFF3DB97E),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .beach_access_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.21, 0.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                                const CircleBorder(),
                                                            child: Container(
                                                              width: 35.0,
                                                              height: 35.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0xFFEF9239),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .local_dining_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.36, 0.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                                const CircleBorder(),
                                                            child: Container(
                                                              width: 35.0,
                                                              height: 35.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons.business,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 15.0),
                                          child: Text(
                                            'Welcome',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 25.0, 0.0, 25.0),
                                                  child: Text(
                                                    'Your AI travel companion is here! Our app uses smart technology to create personalized trips that match what you love. It\'s like having a travel expert in your pocket, making your adventures awesome and easy',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 294.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Lottie.network(
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/prayul-travel-a-i-gnvwov/assets/6f3fvlrah9ih/AI_processing_Loader.json',
                                            width: 300.0,
                                            height: 130.0,
                                            fit: BoxFit.fill,
                                            animate: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 60.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('ChooseLocationPage');
                                      },
                                      text: 'Start Your Trip',
                                      options: FFButtonOptions(
                                        width: 160.0,
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  if (false)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Travel-PNG-HD.png',
                                        width: double.infinity,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                ],
                              ),
                              if (false)
                                wrapWithModel(
                                  model: _model.danceMonkeyLoaderModel1,
                                  updateCallback: () => setState(() {}),
                                  child: const DanceMonkeyLoaderWidget(),
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '     ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Text(
                                          'Home',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          icon: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed(
                                                'ChooseLocationPage');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final tripHistoryData =
                                          homeExplorePageTravelDataRecordList
                                              .map((e) => e)
                                              .toList();
                                      return ListView.builder(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          12.0,
                                          0,
                                          0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: tripHistoryData.length,
                                        itemBuilder:
                                            (context, tripHistoryDataIndex) {
                                          final tripHistoryDataItem =
                                              tripHistoryData[
                                                  tripHistoryDataIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState().jsondataSample =
                                                    functions
                                                        .convertStringToJson(
                                                            tripHistoryDataItem
                                                                .jsonData);
                                                FFAppState().selectedStartDate =
                                                    tripHistoryDataItem
                                                        .startDate;
                                                FFAppState().selectedEndDate =
                                                    tripHistoryDataItem.endDate;
                                              });

                                              context.pushNamed(
                                                'TripPage',
                                                queryParameters: {
                                                  'cityImage': serializeParam(
                                                    tripHistoryDataItem
                                                        .imageUrl,
                                                    ParamType.String,
                                                  ),
                                                  'isFromHome': serializeParam(
                                                    true,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: FavoritesCardWidget(
                                              key: Key(
                                                  'Keyxrj_${tripHistoryDataIndex}_of_${tripHistoryData.length}'),
                                              startDateHistory: dateTimeFormat(
                                                  'MMMMEEEEd',
                                                  tripHistoryDataItem
                                                      .startDate!),
                                              tripDateHistory:
                                                  functions.convertStringToJson(
                                                      tripHistoryDataItem
                                                          .jsonData),
                                              image:
                                                  tripHistoryDataItem.imageUrl,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ].divide(const SizedBox(height: 12.0)),
                              ),
                              if (false)
                                wrapWithModel(
                                  model: _model.danceMonkeyLoaderModel2,
                                  updateCallback: () => setState(() {}),
                                  child: const DanceMonkeyLoaderWidget(),
                                ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
