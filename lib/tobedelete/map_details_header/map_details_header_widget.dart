import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'map_details_header_model.dart';
export 'map_details_header_model.dart';

class MapDetailsHeaderWidget extends StatefulWidget {
  const MapDetailsHeaderWidget({
    super.key,
    required this.data,
  });

  final dynamic data;

  @override
  State<MapDetailsHeaderWidget> createState() => _MapDetailsHeaderWidgetState();
}

class _MapDetailsHeaderWidgetState extends State<MapDetailsHeaderWidget> {
  late MapDetailsHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapDetailsHeaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: () {
          if (getJsonField(
                widget.data,
                r'''$.type''',
              ).toString() ==
              'Food') {
            return const Color(0xFFF2B297);
          } else if (getJsonField(
                widget.data,
                r'''$.type''',
              ).toString() ==
              'Drink') {
            return const Color(0xFF70D4C9);
          } else if (getJsonField(
                widget.data,
                r'''$.type''',
              ).toString() ==
              'Hotel') {
            return const Color(0xFFFF9CE0);
          } else {
            return const Color(0xD2EE8B60);
          }
        }(),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 8.0, 0.0),
              child: Icon(
                Icons.fastfood_sharp,
                color: () {
                  if (getJsonField(
                        widget.data,
                        r'''$.type''',
                      ).toString() ==
                      'Food') {
                    return const Color(0xFFF47139);
                  } else if (getJsonField(
                        widget.data,
                        r'''$.type''',
                      ).toString() ==
                      'Drink') {
                    return FlutterFlowTheme.of(context).accent2;
                  } else if (getJsonField(
                        widget.data,
                        r'''$.type''',
                      ).toString() ==
                      'Hotel') {
                    return const Color(0xFFFD33BE);
                  } else {
                    return const Color(0xD2A93200);
                  }
                }(),
                size: 18.0,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
              child: Text(
                getJsonField(
                  widget.data,
                  r'''$.place_type''',
                ).toString(),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: () {
                        if (getJsonField(
                              widget.data,
                              r'''$.type''',
                            ).toString() ==
                            'Food') {
                          return const Color(0xFFF47139);
                        } else if (getJsonField(
                              widget.data,
                              r'''$.type''',
                            ).toString() ==
                            'Drink') {
                          return FlutterFlowTheme.of(context).accent2;
                        } else if (getJsonField(
                              widget.data,
                              r'''$.type''',
                            ).toString() ==
                            'Hotel') {
                          return const Color(0xFFFD33BE);
                        } else {
                          return const Color(0xD2A93200);
                        }
                      }(),
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
