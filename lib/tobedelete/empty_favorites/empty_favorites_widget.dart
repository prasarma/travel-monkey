import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_favorites_model.dart';
export 'empty_favorites_model.dart';

class EmptyFavoritesWidget extends StatefulWidget {
  const EmptyFavoritesWidget({super.key});

  @override
  State<EmptyFavoritesWidget> createState() => _EmptyFavoritesWidgetState();
}

class _EmptyFavoritesWidgetState extends State<EmptyFavoritesWidget> {
  late EmptyFavoritesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyFavoritesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/wishlist-icon-comic-style-like-document-cartoon-vector-illustration-white-isolated-background-favorite-list-splash-effect-business-concept_157943-17833.jpg',
            width: 300.0,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
          child: Text(
            'You dont\'t have any favorites\n yet!',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}
