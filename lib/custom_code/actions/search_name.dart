// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> searchName(
  List<dynamic> list,
  String searchTerm,
) async {
  // Add your function code here!
  List<dynamic> listSearch = [];

  list.forEach((element) {
    if (element["name"]
        .toString()
        .toLowerCase()
        .contains(searchTerm.toString().toLowerCase())) {
      listSearch.add(element);
    }
  });

  return listSearch;
}
