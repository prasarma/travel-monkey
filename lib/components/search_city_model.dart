import '/flutter_flow/flutter_flow_util.dart';
import 'search_city_widget.dart' show SearchCityWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SearchCityModel extends FlutterFlowModel<SearchCityWidget> {
  ///  Local state fields for this component.

  List<dynamic> listOfSearchData = [];
  void addToListOfSearchData(dynamic item) => listOfSearchData.add(item);
  void removeFromListOfSearchData(dynamic item) =>
      listOfSearchData.remove(item);
  void removeAtIndexFromListOfSearchData(int index) =>
      listOfSearchData.removeAt(index);
  void insertAtIndexInListOfSearchData(int index, dynamic item) =>
      listOfSearchData.insert(index, item);
  void updateListOfSearchDataAtIndex(int index, Function(dynamic) updateFn) =>
      listOfSearchData[index] = updateFn(listOfSearchData[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchName] action in TextField widget.
  List<dynamic>? listResult;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    expandableExpandableController.dispose();
  }
}
