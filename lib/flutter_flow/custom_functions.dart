import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? convertDoubleToPercentage(double value) {
  return (value * 100).toStringAsFixed(0) + '%';
}

List<dynamic> convertJsonToJsonList(dynamic dataJson) {
  List<dynamic> listData = [];

  dataJson.forEach((element) {
    listData.add(element);
  });

  return listData;
}

LatLng parseLatLng(String latlngInStr) {
  List<String> latLngList = latlngInStr.split(',');
  if (latLngList.length == 2) {
    try {
      double latitude = double.parse(latLngList[0]);
      double longitude = double.parse(latLngList[1]);
      return LatLng(latitude, longitude);
    } catch (e) {
      print('Error parsing latitude and longitude: $e');
    }
  } else {
    print('Invalid latitude and longitude string format');
  }
  // Return null or any default value to handle errors
  return LatLng(0.0, 0.0);
}

dynamic trimTripData(
  dynamic data,
  int numberOfTripsToKeep,
) {
  dynamic trimmedJsonData;

  List<dynamic> trips = data['trip'];

  if (trips.length > numberOfTripsToKeep) {
    data['trip'] = trips.sublist(0, numberOfTripsToKeep);
  }

  trimmedJsonData = data;

  // if (data.containsKey('trip') && data['trip'] is List) {

  // } else {
  //   print('Invalid JSON format or missing "trip" key.');
  // }

  return trimmedJsonData;
}

dynamic itineraryPageData(
  DateTime startDate,
  int? numberOfDays,
  int? companionship,
  dynamic tripJson,
) {
  dynamic toreturn = {
    "startDate": startDate.toString(),
    "numberOfDays": numberOfDays ?? 0,
    "companionship": companionship ?? 2,
    "tripDetails": tripJson
  };

  return toreturn;
}

DateTime parseDateToString(String strDate) {
  return DateTime.parse(strDate);
}

dynamic generatejsonFunction(
  String city,
  int person,
  String fromDate,
  String endDate,
  List<String> activitiesList,
) {
  Map<String, dynamic> travelDetails = {
    'CITY': city,
    'PERSON': person,
    'FROM_DATE': fromDate,
    'END_DATE': endDate,
    'ACTIVITIES_List': activitiesList
  };
  return jsonEncode(travelDetails);
}

String? createItineraryPrompt(dynamic data) {
  //final body = json.decode(data);

  var newData = jsonDecode(data);
  String prompt =
      'Place: <CITY> ; Number of person: <PERSON> ; Date range : <FROM_DATE> - <END_DATE> ; Preferable : <ACTIVITIES_LIST> ; create a itinerary plan for me and per day activities should be 2 or 3 only. Please structure the response. Example of the response {"city":"<Place_NAME>","about":"<Generate description for the Place in 300-500 words>","important_point":["Be caution with pocket pickers","Please bargen form with local shopkeeper bcz they charges high for tourist"],"emergency_contact_list":[{"text":"Police","phone_number":"<Phone Number Only>"}],"trip":[{"day":"Day 1","activities":[{"type":"Historical","place_name":"The City Palace","place_desc":"City Palace forms one of the most famous tourist attractions and a major landmark in Jaipur. The beautiful palace was built by Maharaja Sawai Jai Singh during his reign. Among the various forts and palaces of Jaipur, City Palace stands apart, with its outstanding art and architecture.","review":4.5}]}]}';

  var arr = newData["CITY"].toString().split(",")[0];

  prompt = prompt.replaceAll("<CITY>", arr);
  prompt = prompt.replaceAll("<PERSON>", newData["PERSON"].toString());
  prompt = prompt.replaceAll("<FROM_DATE>", newData['FROM_DATE']);
  prompt = prompt.replaceAll("<END_DATE>", newData['END_DATE']);
  prompt = prompt.replaceAll(
      "<ACTIVITIES_LIST>", newData['ACTIVITIES_List'].toString());
  return prompt;
}

List<String> highRatingsCategories(
  double historical,
  double artCulture,
  double wildlife,
  double localMarket,
  double romantic,
  double localCuisine,
) {
  {
    List<String> categories = [];

    if (historical > 5) {
      categories.add("Historical");
    }
    if (artCulture > 5) {
      categories.add("Art & Culture");
    }
    if (wildlife > 5) {
      categories.add("Wildlife");
    }
    if (localMarket > 5) {
      categories.add("Local Market");
    }
    if (romantic > 5) {
      categories.add("Romantic");
    }
    if (localCuisine > 5) {
      categories.add("Local Cuisine");
    }

    return categories;
  }
}

dynamic jsonStringToJSON(String jsonString) {
  return json.decode(jsonString);
}

int getStringLength(String value) {
  value = value.trim();
  return value.length;
}

String convertJsonToString(dynamic data) {
  return jsonEncode(data);
}

dynamic convertStringToJson(String data) {
  return jsonDecode(data);
}
