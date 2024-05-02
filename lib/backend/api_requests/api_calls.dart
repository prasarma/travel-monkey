import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Leonardo API Group Code

class LeonardoAPIGroup {
  static String baseUrl = 'https://cloud.leonardo.ai/api/rest/v1/';
  static Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json',
    'authorization': 'Bearer c8e74a43-cf8b-4c80-94b5-6fe13d776358',
  };
  static GenerateImageCall generateImageCall = GenerateImageCall();
  static GetImageCall getImageCall = GetImageCall();
}

class GenerateImageCall {
  Future<ApiCallResponse> call({
    int? height,
    String? textPrompt = '',
    int? width,
  }) async {
    final ffApiRequestBody = '''
{
  "alchemy": true,
  "height": $height,
  "modelId": "aa77f04e-3eec-4034-9c07-d0f619684628",
  "prompt": "$textPrompt",
  "width": $width,
  "guidance_scale": 9,
  "highResolution": true,
  "num_images": 1,
  "photoReal": true,
  "photoRealVersion": "v2",
  "public": false,
  "presetStyle": "PHOTOGRAPHY"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Image',
      apiUrl: '${LeonardoAPIGroup.baseUrl}/generations',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': 'Bearer c8e74a43-cf8b-4c80-94b5-6fe13d776358',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? genId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sdGenerationJob.generationId''',
      ));
}

class GetImageCall {
  Future<ApiCallResponse> call({
    String? genId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Image',
      apiUrl: '${LeonardoAPIGroup.baseUrl}generations/$genId',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': 'Bearer c8e74a43-cf8b-4c80-94b5-6fe13d776358',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? imageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.generations_by_pk.generated_images[0].url''',
      ));
  dynamic mainJson(dynamic response) => getJsonField(
        response,
        r'''$.generations_by_pk''',
      );
  List? imsgeList(dynamic response) => getJsonField(
        response,
        r'''$.generations_by_pk.generated_images''',
        true,
      ) as List?;
}

/// End Leonardo API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
