import '/components/dance_monkey_loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'favorite_page_model.dart';
export 'favorite_page_model.dart';

class FavoritePageWidget extends StatefulWidget {
  const FavoritePageWidget({super.key});

  @override
  State<FavoritePageWidget> createState() => _FavoritePageWidgetState();
}

class _FavoritePageWidgetState extends State<FavoritePageWidget> {
  late FavoritePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.showTransition = true;
      });
      await Future.delayed(const Duration(milliseconds: 1000));
      setState(() {
        _model.showTransition = false;
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: !_model.showTransition
            ? AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  'Favorites',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                actions: const [],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
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
