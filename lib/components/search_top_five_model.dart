import '/flutter_flow/flutter_flow_util.dart';
import 'search_top_five_widget.dart' show SearchTopFiveWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SearchTopFiveModel extends FlutterFlowModel<SearchTopFiveWidget> {
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

  FFUploadedFile? photo;

  bool photoUploaded = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionTextController;
  String? Function(BuildContext, String?)? questionTextControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    questionFocusNode?.dispose();
    questionTextController?.dispose();

    expandableExpandableController.dispose();
  }
}
