import '/components/dance_monkey_loader_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favorite_page_widget.dart' show FavoritePageWidget;
import 'package:flutter/material.dart';

class FavoritePageModel extends FlutterFlowModel<FavoritePageWidget> {
  ///  Local state fields for this page.

  bool showTransition = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for danceMonkeyLoader component.
  late DanceMonkeyLoaderModel danceMonkeyLoaderModel;

  @override
  void initState(BuildContext context) {
    danceMonkeyLoaderModel =
        createModel(context, () => DanceMonkeyLoaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    danceMonkeyLoaderModel.dispose();
  }
}
