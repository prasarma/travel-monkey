import '/components/dance_monkey_loader_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'choose_location_page_model.dart';
export 'choose_location_page_model.dart';

class ChooseLocationPageWidget extends StatefulWidget {
  const ChooseLocationPageWidget({super.key});

  @override
  State<ChooseLocationPageWidget> createState() =>
      _ChooseLocationPageWidgetState();
}

class _ChooseLocationPageWidgetState extends State<ChooseLocationPageWidget> {
  late ChooseLocationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseLocationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
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
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                actions: const [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 1.0,
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 0.0),
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!_model.showTransition)
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: custom_widgets.CountryListPage(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                        ),
                      ),
                    ),
                ],
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
