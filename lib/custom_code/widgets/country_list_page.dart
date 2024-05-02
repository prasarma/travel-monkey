// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_svg/svg.dart';

class CountryListPage extends StatefulWidget {
  const CountryListPage({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CountryListPageState createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  List<Country> countries = [];
  List<Country> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  void loadCountries() {
    List<dynamic> countryJson = jsonDecode(CountryData.jsonData);
    setState(() {
      countries = countryJson.map((json) => Country.fromJson(json)).toList();
      filteredCountries = countries;
    });
  }

  void _searchCountry(String query) {
    final suggestions = countries.where((country) {
      final countryName = country.name.toLowerCase();
      final input = query.toLowerCase();
      return countryName.contains(input);
    }).toList();

    setState(() {
      filteredCountries = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _searchCountry,
              decoration: InputDecoration(
                labelText: 'Search Country',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SvgPicture.network(
                    filteredCountries[index].image,
                    width: 50,
                    height: 30,
                    placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  title: Text(filteredCountries[index].name),
                  onTap: () {
                    context.pushNamed(
                      'TravelDuration',
                      queryParameters: {
                        'selectedCountry': serializeParam(
                          filteredCountries[index].name,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Country {
  String name;
  String code;
  String image;

  Country({required this.name, required this.code, required this.image});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
      image: json['image'],
    );
  }
}

class CountryData {
  static const String jsonData = '''[

  {
    "name": "Agra, India",
    "code": "IN",
    "image": "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IN.svg"
  },
  {
    "name": "Banglore, India",
    "code": "IN",
    "image": "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IN.svg"
  },
  {
    "name": "Jaipur, India",
    "code": "IN",
    "image": "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IN.svg"
  },
  {
    "name": "Mumbai, India",
    "code": "IN",
    "image": "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IN.svg"
  },
  {
    "name": "New Delhi, India",
    "code": "IN",
    "image": "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IN.svg"
  },
  {
    "name": "Sydney, Australia",
    "code": "AU",
    "image": "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AU.svg"
  },
  {
    "name": "Capetown, South Africa",
    "code": "ZA",
    "image": "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ZA.svg"
  },
  {
    "name": "New York, United States",
    "code": "US",
    "image": "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/US.svg"
  },
  {
    "name": "Dubai, United Arab Emirates",
    "code": "AE",
    "image": "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AE.svg"
  },
  {
    "name": "Paris, France",
    "code": "FR",
    "image": "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/FR.svg"
  }
]''';
}
