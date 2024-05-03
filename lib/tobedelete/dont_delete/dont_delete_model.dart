import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dont_delete_widget.dart' show DontDeleteWidget;
import 'package:flutter/material.dart';

class DontDeleteModel extends FlutterFlowModel<DontDeleteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
