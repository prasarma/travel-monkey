import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_generated_page1_widget.dart' show AIGeneratedPage1Widget;
import 'package:flutter/material.dart';

class AIGeneratedPage1Model extends FlutterFlowModel<AIGeneratedPage1Widget> {
  ///  Local state fields for this page.

  double loading = 0.2;

  dynamic localData;

  bool imageGet = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Gemini - Generate Text] action in AIGeneratedPage1 widget.
  String? geminiResponse;
  // Stores action output result for [Backend Call - API (Generate Image)] action in AIGeneratedPage1 widget.
  ApiCallResponse? leoImage;
  // Stores action output result for [Action Block - getImageFromId] action in AIGeneratedPage1 widget.
  String? imageResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future<String?> getImageFromId(
    BuildContext context, {
    required String? genId,
  }) async {
    ApiCallResponse? apiResult;

    while (!imageGet) {
      apiResult = await LeonardoAPIGroup.getImageCall.call(
        genId: genId,
      );
      if ((apiResult.succeeded ?? true) &&
          (LeonardoAPIGroup.getImageCall.mainJson(
                (apiResult.jsonBody ?? ''),
              ) !=
              null) &&
          (LeonardoAPIGroup.getImageCall
                  .imsgeList(
                    (apiResult.jsonBody ?? ''),
                  )!.isNotEmpty)) {
        imageGet = true;
      } else {
        await Future.delayed(const Duration(milliseconds: 4000));
      }
    }
    return LeonardoAPIGroup.getImageCall.imageUrl(
      (apiResult?.jsonBody ?? ''),
    );
  }
}
