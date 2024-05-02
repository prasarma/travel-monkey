import '/components/dance_monkey_loader_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_explore_page_widget.dart' show HomeExplorePageWidget;
import 'package:flutter/material.dart';

class HomeExplorePageModel extends FlutterFlowModel<HomeExplorePageWidget> {
  ///  Local state fields for this page.

  bool showTransition = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for danceMonkeyLoader component.
  late DanceMonkeyLoaderModel danceMonkeyLoaderModel1;
  // Model for danceMonkeyLoader component.
  late DanceMonkeyLoaderModel danceMonkeyLoaderModel2;

  @override
  void initState(BuildContext context) {
    danceMonkeyLoaderModel1 =
        createModel(context, () => DanceMonkeyLoaderModel());
    danceMonkeyLoaderModel2 =
        createModel(context, () => DanceMonkeyLoaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    danceMonkeyLoaderModel1.dispose();
    danceMonkeyLoaderModel2.dispose();
  }
}
