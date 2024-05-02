import '/flutter_flow/flutter_flow_util.dart';
import 'interest_page_widget.dart' show InterestPageWidget;
import 'package:flutter/material.dart';

class InterestPageModel extends FlutterFlowModel<InterestPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SliderHistoric widget.
  double? sliderHistoricValue;
  // State field(s) for Slieder widget.
  double? sliederValue;
  // State field(s) for Sliderwildlife widget.
  double? sliderwildlifeValue;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for SliderLocalMarket widget.
  double? sliderLocalMarketValue;
  // State field(s) for SliderRomantic widget.
  double? sliderRomanticValue;
  // State field(s) for SliderCuisine widget.
  double? sliderCuisineValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
