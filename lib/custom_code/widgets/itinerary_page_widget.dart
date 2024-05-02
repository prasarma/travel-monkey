// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItineraryPageModel extends FlutterFlowModel<ItineraryPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;

  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

List<String> extractLatlng(dynamic jsonData, int index) {
  List<String> latlngList = [];
  List<dynamic> dailyTripData = jsonData['trip'][index]['activities'];

  dynamic tripData = jsonData['trip'][index];

  for (var activity in tripData['activities']) {
    latlngList.add(activity['latlng']);
  }

  FFAppState().tmpLatLng = latlngList;
  FFAppState().tmpDailyTripData = dailyTripData;

  return latlngList;
}

class ItineraryPageWidget extends StatefulWidget {
  const ItineraryPageWidget({
    Key? key,
    this.width,
    this.height,
    this.startDate,
    this.numberOfDays,
    this.companionship,
    required this.tripJson,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DateTime? startDate;
  final int? numberOfDays;
  final int? companionship;
  final dynamic tripJson;

  @override
  _ItineraryPageWidgetState createState() => _ItineraryPageWidgetState();
}

class _ItineraryPageWidgetState extends State<ItineraryPageWidget> {
  late ItineraryPageModel _model;
  bool _showAppBar = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  String companionString = 'Group';

  setCompanion() {
    if (widget.companionship == 1) {
      companionString = 'Solo';
    } else if (widget.companionship == 2) {
      companionString = 'Couple';
    } else {
      companionString = 'Group';
    }
  }

  @override
  void initState() {
    super.initState();
    extractLatlng(widget.tripJson, 0);
    setCompanion();
    _model = createModel(context, () => ItineraryPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().activeIndex = 0;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          elevation: 0,
          leading: AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child: _showAppBar
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'CustomNavbar',
                          queryParameters: {
                            'currentIndex': serializeParam(
                              0,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'CustomNavbar',
                          queryParameters: {
                            'currentIndex': serializeParam(
                              0,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.arrow_back_ios_rounded,
                              color:
                                  FlutterFlowTheme.of(context).secondaryText),
                        ),
                      ),
                    ),
                  ),
          ),
          backgroundColor: _showAppBar
              ? FlutterFlowTheme.of(context).primaryBackground
              : Colors.transparent,
          automaticallyImplyLeading: false,
          bottomOpacity: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Theme.of(context).brightness,
            statusBarIconBrightness: Theme.of(context).brightness,
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
          ),
          actions: _showAppBar
              ? [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                custom_widgets.CustomGoogleMap(),
                          ),
                        );
                      },
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.map,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),
                  )
                ]
              : [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                custom_widgets.CustomGoogleMap(),
                          ),
                        );
                      },
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.map,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification) {
              setState(() {
                _showAppBar = scrollNotification.metrics.pixels > 20;
              });
            }
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                custom_widgets.CustomGoogleMap(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: FlutterFlowGoogleMap(
                          controller: _model.googleMapsController,
                          onCameraIdle: (latLng) =>
                              _model.googleMapsCenter = latLng,
                          initialLocation: _model.googleMapsCenter ??=
                              LatLng(13.106061, -59.613158),
                          markerColor: GoogleMarkerColor.violet,
                          mapType: MapType.normal,
                          style: GoogleMapStyle.standard,
                          initialZoom: 14.0,
                          allowInteraction: false,
                          allowZoom: false,
                          showZoomControls: false,
                          showLocation: true,
                          showCompass: false,
                          showMapToolbar: false,
                          showTraffic: false,
                          centerMapOnMarkerTap: false,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 120.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x3C000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        getJsonField(
                                          widget.tripJson,
                                          r'''$.city''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.ellipsisH,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'India',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      Text(
                                        '${widget.numberOfDays ?? 1} days, with $companionString, 2023',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          'https://picsum.photos/seed/963/600',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(height: 8.0))
                                  .addToEnd(SizedBox(height: 6.0)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final dailyPlan = getJsonField(
                                      widget.tripJson,
                                      r'''$.trip''',
                                    ).toList();
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                            dailyPlan.length, (dailyPlanIndex) {
                                          final dailyPlanItem =
                                              dailyPlan[dailyPlanIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              extractLatlng(widget.tripJson,
                                                  dailyPlanIndex);
                                              FFAppState().update(() {
                                                FFAppState().activeIndex =
                                                    dailyPlanIndex;
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: dailyPlanIndex ==
                                                        FFAppState().activeIndex
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 12.0, 12.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        dailyPlanItem,
                                                        r'''$.day''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            color: dailyPlanIndex ==
                                                                    FFAppState()
                                                                        .activeIndex
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                          ),
                                                    ),
                                                    Text(
                                                      '${dailyPlanIndex == FFAppState().activeIndex ? dateTimeFormat('EEEE', widget.startDate) : ''}${dailyPlanIndex == FFAppState().activeIndex ? ' ' : ''}${dateTimeFormat('dd', widget.startDate?.add(Duration(days: dailyPlanIndex)))}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            color: dailyPlanIndex ==
                                                                    FFAppState()
                                                                        .activeIndex
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 6.0)),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ].addToStart(SizedBox(width: 12.0)),
                        ),
                        custom_widgets.ItineraryCardsView(
                          width: double.infinity,
                          // height: 200,
                          index: FFAppState().activeIndex,
                        ),
                      ]
                          .divide(SizedBox(height: 12.0))
                          .addToStart(SizedBox(height: 150.0))
                          .addToEnd(SizedBox(height: 40.0)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
