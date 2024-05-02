import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/explore_journey_pages/swipeable_stack_page_view/swipeable_stack_page_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'swipe_trip_location_model.dart';
export 'swipe_trip_location_model.dart';

class SwipeTripLocationWidget extends StatefulWidget {
  const SwipeTripLocationWidget({super.key});

  @override
  State<SwipeTripLocationWidget> createState() =>
      _SwipeTripLocationWidgetState();
}

class _SwipeTripLocationWidgetState extends State<SwipeTripLocationWidget> {
  late SwipeTripLocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeTripLocationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.placesList = await queryPlacesRecordOnce();
      setState(() {
        _model.totalRecordCount = valueOrDefault<double>(
          _model.placesList?.length.toDouble(),
          1.0,
        );
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
    return StreamBuilder<List<PlacesRecord>>(
      stream: queryPlacesRecord(),
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
        List<PlacesRecord> swipeTripLocationPlacesRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 10.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Travel Board  ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('AIGeneratedPage1');
                              },
                              child: Text(
                                'Done',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 20.0),
                    child: LinearPercentIndicator(
                      percent: _model.progressValue,
                      lineHeight: 15.0,
                      animation: false,
                      animateFromLastPercent: true,
                      progressColor: FlutterFlowTheme.of(context).primary,
                      center: Text(
                        functions
                            .convertDoubleToPercentage(_model.progressValue)!,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                      barRadius: const Radius.circular(50.0),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  if (swipeTripLocationPlacesRecordList.length != _model.count)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 10.0),
                        child: Builder(
                          builder: (context) {
                            final children = swipeTripLocationPlacesRecordList
                                .map((e) => e)
                                .toList();
                            return FlutterFlowSwipeableStack(
                              onSwipeFn: (index) {},
                              onLeftSwipe: (index) async {
                                final childrenItem = children[index];
                                setState(() {
                                  _model.count = _model.count + 1;
                                });
                                setState(() {
                                  _model.progressValue =
                                      _model.count.toDouble() /
                                          _model.totalRecordCount;
                                });
                                if (_model.progressValue == 1.0) {
                                  context.pushNamed('AIGeneratedPage1');

                                  return;
                                } else {
                                  return;
                                }
                              },
                              onRightSwipe: (index) async {
                                final childrenItem = children[index];
                                setState(() {
                                  _model.count = _model.count + 1;
                                });
                                setState(() {
                                  _model.progressValue =
                                      _model.count.toDouble() /
                                          _model.totalRecordCount;
                                });
                                if (_model.progressValue == 1.0) {
                                  context.pushNamed('AIGeneratedPage1');

                                  return;
                                } else {
                                  return;
                                }
                              },
                              onUpSwipe: (index) async {
                                final childrenItem = children[index];
                                _model.swipeableStackController.swipeTop();
                              },
                              onDownSwipe: (index) {},
                              itemBuilder: (context, childrenIndex) {
                                final childrenItem = children[childrenIndex];
                                return Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: 8.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      SwipeableStackPageViewWidget(
                                        key: Key(
                                            'Keyttp_${childrenIndex}_of_${children.length}'),
                                        document: childrenItem,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      childrenItem.name,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 10.0, 0.0, 0.0),
                                              child: Text(
                                                '${childrenItem.rivews} Reviews',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 10.0, 0.0, 20.0),
                                              child: Text(
                                                '${childrenItem.matched.toString()} % Matched',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 45.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderRadius: 50.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 50.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    icon: Icon(
                                                      Icons.close_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      _model
                                                          .swipeableStackController
                                                          .swipeLeft();
                                                    },
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 50.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 50.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    icon: Icon(
                                                      Icons.favorite_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      _model
                                                          .swipeableStackController
                                                          .swipeRight();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: children.length,
                              controller: _model.swipeableStackController,
                              loop: false,
                              cardDisplayCount: 3,
                              scale: 0.9,
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
