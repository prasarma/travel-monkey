import '/components/search_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'search_top_five_model.dart';
export 'search_top_five_model.dart';

class SearchTopFiveWidget extends StatefulWidget {
  const SearchTopFiveWidget({
    super.key,
    required this.onSearch,
  });

  final Future Function()? onSearch;

  @override
  State<SearchTopFiveWidget> createState() => _SearchTopFiveWidgetState();
}

class _SearchTopFiveWidgetState extends State<SearchTopFiveWidget>
    with TickerProviderStateMixin {
  late SearchTopFiveModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchTopFiveModel());

    _model.questionTextController ??= TextEditingController();
    _model.questionFocusNode ??= FocusNode();

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.85,
      decoration: BoxDecoration(
        color: const Color(0xAD000000),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/ezgif.com-crop_(4).gif',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_model.photo != null &&
                (_model.photo?.bytes?.isNotEmpty ?? false))
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.memory(
                      _model.photo?.bytes ?? Uint8List.fromList([]),
                      width: double.infinity,
                      height: 220.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          borderRadius: 20.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.close_sharp,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            setState(() {
                              _model.photo = null;
                              _model.photoUploaded = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
              child: Text(
                'Ask your question',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.questionTextController,
                  focusNode: _model.questionFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    hintText: 'Top 5 candle light dinner places...',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                      ),
                  maxLines: 3,
                  validator: _model.questionTextControllerValidator
                      .asValidator(context),
                ),
              ),
            ),
            if (false)
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Builder(
                    builder: (context) {
                      final topFive = _model.listOfSearchData.toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: topFive.length,
                        itemBuilder: (context, topFiveIndex) {
                          final topFiveItem = topFive[topFiveIndex];
                          return SearchItemWidget(
                            key: Key(
                                'Keyh5t_${topFiveIndex}_of_${topFive.length}'),
                            cityData: topFiveItem,
                            onSearchClick: () async {
                              setState(() {
                                FFAppState().selectedTopFive = functions
                                    .convertJsonToJsonList(getJsonField(
                                      topFiveItem,
                                      r'''$.top_five_place''',
                                    ))
                                    .toList()
                                    .cast<dynamic>();
                              });
                              await widget.onSearch?.call();
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            if (false)
              Container(
                width: double.infinity,
                color: const Color(0x00000000),
                child: ExpandableNotifier(
                  controller: _model.expandableExpandableController,
                  child: ExpandablePanel(
                    header: Text(
                      'Example Prompts',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    collapsed: Container(),
                    expanded: Builder(
                      builder: (context) {
                        final topFive = functions
                            .convertJsonToJsonList(getJsonField(
                              FFAppState().selectedCityData,
                              r'''$.top_place''',
                            ))
                            .toList()
                            .take(4)
                            .toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: topFive.length,
                          itemBuilder: (context, topFiveIndex) {
                            final topFiveItem = topFive[topFiveIndex];
                            return SearchItemWidget(
                              key: Key(
                                  'Keyg8e_${topFiveIndex}_of_${topFive.length}'),
                              cityData: topFiveItem,
                              onSearchClick: () async {
                                setState(() {
                                  FFAppState().selectedTopFive = functions
                                      .convertJsonToJsonList(getJsonField(
                                        topFiveItem,
                                        r'''$.top_five_place''',
                                      ))
                                      .toList()
                                      .cast<dynamic>();
                                });
                                await widget.onSearch?.call();
                              },
                            );
                          },
                        );
                      },
                    ),
                    theme: const ExpandableThemeData(
                      tapHeaderToExpand: true,
                      tapBodyToExpand: false,
                      tapBodyToCollapse: false,
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      hasIcon: true,
                      iconSize: 24.0,
                      iconColor: Color(0xFFCCD0D2),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_model.photo == null ||
                      (_model.photo?.bytes?.isEmpty ?? true))
                    FFButtonWidget(
                      onPressed: () async {
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          imageQuality: 50,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          try {
                            showUploadMessage(
                              context,
                              'Uploading file...',
                              showLoading: true,
                            );
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();
                          } finally {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                              selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFile =
                                  selectedUploadedFiles.first;
                            });
                            showUploadMessage(context, 'Success!');
                          } else {
                            setState(() {});
                            showUploadMessage(context, 'Failed to upload data');
                            return;
                          }
                        }

                        if ((_model.uploadedLocalFile.bytes?.isNotEmpty ??
                                false)) {
                          setState(() {
                            _model.photo = _model.uploadedLocalFile;
                            _model.photoUploaded = true;
                          });
                          return;
                        } else {
                          return;
                        }
                      },
                      text: 'Add Image',
                      options: FFButtonOptions(
                        width: 100.0,
                        height: 40.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 2.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (functions.getStringLength(
                                _model.questionTextController.text) >
                            0) {
                          context.pushNamed(
                            'TripDetails',
                            queryParameters: {
                              'file': serializeParam(
                                _model.photo,
                                ParamType.FFUploadedFile,
                              ),
                              'city': serializeParam(
                                FFAppState().city,
                                ParamType.String,
                              ),
                              'isImageUploaded': serializeParam(
                                _model.photoUploaded,
                                ParamType.bool,
                              ),
                              'prompt': serializeParam(
                                _model.questionTextController.text,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text('Please write the question.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                        }
                      },
                      text: 'Generate',
                      options: FFButtonOptions(
                        width: 100.0,
                        height: 40.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 2.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
