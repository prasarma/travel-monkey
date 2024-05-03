import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'search_item_model.dart';
export 'search_item_model.dart';

class SearchItemWidget extends StatefulWidget {
  const SearchItemWidget({
    super.key,
    required this.onSearchClick,
    required this.cityData,
  });

  final Future Function()? onSearchClick;
  final dynamic cityData;

  @override
  State<SearchItemWidget> createState() => _SearchItemWidgetState();
}

class _SearchItemWidgetState extends State<SearchItemWidget> {
  late SearchItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await widget.onSearchClick?.call();
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 16.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    getJsonField(
                      widget.cityData,
                      r'''$.name''',
                    ).toString(),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                const Icon(
                  Icons.arrow_outward,
                  color: Color(0xFFCCD0D2),
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
