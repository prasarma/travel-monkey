import '/components/map_details_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detail_box_widget.dart' show DetailBoxWidget;
import 'package:flutter/material.dart';

class DetailBoxModel extends FlutterFlowModel<DetailBoxWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for MapDetailsHeader component.
  late MapDetailsHeaderModel mapDetailsHeaderModel;

  @override
  void initState(BuildContext context) {
    mapDetailsHeaderModel = createModel(context, () => MapDetailsHeaderModel());
  }

  @override
  void dispose() {
    mapDetailsHeaderModel.dispose();
  }
}
