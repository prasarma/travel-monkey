import '/components/dance_monkey_loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'trip_plan_page_model.dart';
export 'trip_plan_page_model.dart';

class TripPlanPageWidget extends StatefulWidget {
  const TripPlanPageWidget({super.key});

  @override
  State<TripPlanPageWidget> createState() => _TripPlanPageWidgetState();
}

class _TripPlanPageWidgetState extends State<TripPlanPageWidget> {
  late TripPlanPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TripPlanPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.showTransition = true;
      });
      await Future.delayed(const Duration(milliseconds: 1500));
      setState(() {
        _model.showTransition = false;
      });
      if (!(await getPermissionStatus(locationPermission))) {
        await requestPermission(locationPermission);
        return;
      } else {
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: Visibility(
          visible: !_model.showTransition,
          child: FloatingActionButton(
            onPressed: () async {
              FFAppState().update(() {
                FFAppState().selectedCityData = null;
                FFAppState().selectedTopFive = [];
              });

              context.pushNamed(
                'CustomNavbar',
                queryParameters: {
                  'currentIndex': serializeParam(
                    1,
                    ParamType.int,
                  ),
                }.withoutNulls,
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).itemSelection,
            elevation: 8.0,
            child: Container(
              width: 120.0,
              height: 120.0,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/ezgif.com-crop_(4).gif',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (!_model.showTransition)
                const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.CustomMap(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              if (_model.showTransition)
                wrapWithModel(
                  model: _model.danceMonkeyLoaderModel,
                  updateCallback: () => setState(() {}),
                  child: const DanceMonkeyLoaderWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
