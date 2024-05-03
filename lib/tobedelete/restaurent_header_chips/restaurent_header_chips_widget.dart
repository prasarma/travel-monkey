import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'restaurent_header_chips_model.dart';
export 'restaurent_header_chips_model.dart';

class RestaurentHeaderChipsWidget extends StatefulWidget {
  const RestaurentHeaderChipsWidget({
    super.key,
    required this.data,
    Color? color,
  }) : color = color ?? const Color(0xFF478AF0);

  final dynamic data;
  final Color color;

  @override
  State<RestaurentHeaderChipsWidget> createState() =>
      _RestaurentHeaderChipsWidgetState();
}

class _RestaurentHeaderChipsWidgetState
    extends State<RestaurentHeaderChipsWidget> {
  late RestaurentHeaderChipsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestaurentHeaderChipsModel());
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
        color: widget.color,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 8.0, 0.0),
              child: Icon(
                Icons.no_food,
                color: Color(0xFFD45711),
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
                      color: const Color(0xFFD45711),
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
