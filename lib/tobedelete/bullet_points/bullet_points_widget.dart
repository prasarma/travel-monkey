import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bullet_points_model.dart';
export 'bullet_points_model.dart';

class BulletPointsWidget extends StatefulWidget {
  const BulletPointsWidget({
    super.key,
    this.title,
    this.body,
  });

  final String? title;
  final String? body;

  @override
  State<BulletPointsWidget> createState() => _BulletPointsWidgetState();
}

class _BulletPointsWidgetState extends State<BulletPointsWidget> {
  late BulletPointsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BulletPointsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle_sharp,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 8.0,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
          child: RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.title!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const TextSpan(
                  text: ' :  ',
                  style: TextStyle(),
                )
              ],
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            widget.body!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
