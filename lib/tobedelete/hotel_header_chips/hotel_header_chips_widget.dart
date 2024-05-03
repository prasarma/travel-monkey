import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'hotel_header_chips_model.dart';
export 'hotel_header_chips_model.dart';

class HotelHeaderChipsWidget extends StatefulWidget {
  const HotelHeaderChipsWidget({
    super.key,
    required this.data,
    Color? color,
  }) : color = color ?? const Color(0xFF478AF0);

  final dynamic data;
  final Color color;

  @override
  State<HotelHeaderChipsWidget> createState() => _HotelHeaderChipsWidgetState();
}

class _HotelHeaderChipsWidgetState extends State<HotelHeaderChipsWidget> {
  late HotelHeaderChipsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HotelHeaderChipsModel());
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
                Icons.hotel_sharp,
                color: Color(0xFF1947B4),
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
                      color: const Color(0xFF1947B4),
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
