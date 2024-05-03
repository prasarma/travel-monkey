import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tobedelete/search_item/search_item_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'search_city_model.dart';
export 'search_city_model.dart';

class SearchCityWidget extends StatefulWidget {
  const SearchCityWidget({
    super.key,
    required this.onSearch,
    required this.list,
  });

  final Future Function()? onSearch;
  final List<dynamic>? list;

  @override
  State<SearchCityWidget> createState() => _SearchCityWidgetState();
}

class _SearchCityWidgetState extends State<SearchCityWidget>
    with TickerProviderStateMixin {
  late SearchCityModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchCityModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      width: MediaQuery.sizeOf(context).width * 0.9,
      decoration: BoxDecoration(
        color: const Color(0xAD000000),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
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
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              const Duration(milliseconds: 10),
                              () async {
                                _model.listResult = await actions.searchName(
                                  widget.list!.toList(),
                                  _model.textController.text,
                                );
                                setState(() {
                                  _model.listOfSearchData = _model.listResult!
                                      .toList()
                                      .cast<dynamic>();
                                });
                                setState(() {
                                  FFAppState().city =
                                      _model.textController.text;
                                });

                                setState(() {});
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Write your city name...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 0.0, 0.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if ((_model.textController.text != '') &&
                responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
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
                      final city = _model.listResult!.toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: city.length,
                        itemBuilder: (context, cityIndex) {
                          final cityItem = city[cityIndex];
                          return SearchItemWidget(
                            key: Key('Keyzx2_${cityIndex}_of_${city.length}'),
                            cityData: cityItem,
                            onSearchClick: () async {
                              setState(() {
                                FFAppState().selectedCityData = cityItem;
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
                      'Cities',
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
                        final cityName = functions
                            .convertJsonToJsonList(FFAppState().cityData)
                            .toList()
                            .take(4)
                            .toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: cityName.length,
                          itemBuilder: (context, cityNameIndex) {
                            final cityNameItem = cityName[cityNameIndex];
                            return SearchItemWidget(
                              key: Key(
                                  'Keyfid_${cityNameIndex}_of_${cityName.length}'),
                              cityData: cityNameItem,
                              onSearchClick: () async {
                                setState(() {
                                  FFAppState().selectedCityData = cityNameItem;
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
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
              child: FFButtonWidget(
                onPressed: () async {
                  setState(() {});
                  await widget.onSearch?.call();
                },
                text: 'Next',
                options: FFButtonOptions(
                  width: 80.0,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
