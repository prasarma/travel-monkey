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

import 'package:travel_monkey/home_explore_page/home_explore_page_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_monkey/favorite_page/favorite_page_widget.dart';
import 'package:travel_monkey/pages/profile/profile_page/profile_page_widget.dart';
import 'package:travel_monkey/trip_plan_page/trip_plan_page_widget.dart';
import 'index.dart'; // Imports other custom widgets

class Navbar extends StatefulWidget {
  const Navbar({
    Key? key,
    this.width,
    this.height,
    required this.selectedColor,
    required this.unselectedColor,
    required this.currentIndex,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color selectedColor;
  final Color unselectedColor;
  final int currentIndex;

  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    setState(() {});
  }

  // replace list item with your class name
  List<Widget> currentPage = [
    HomeExplorePageWidget(),
    TripPlanPageWidget(),
    // FavoritePageWidget(),
    ProfilePageWidget(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: currentPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 50,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        selectedIconTheme: IconThemeData(color: widget.selectedColor, size: 28),
        unselectedIconTheme:
            IconThemeData(color: widget.unselectedColor, size: 28),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: widget.selectedColor,
        onTap: (int index) {
          // setState(() {
          //   currentIndex = index;
          // });

          context.pushNamed(
            'CustomNavbar',
            queryParameters: {
              'currentIndex': serializeParam(
                index,
                ParamType.int,
              ),
            }.withoutNulls,
          );
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                FFIcons.kstarLocation,
              ),
              label: "Trip Plan"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.umbrellaBeach,
              ),
              label: "Explore"),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       FontAwesomeIcons.solidHeart,
          //     ),
          //     label: "Favourites"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidCircleUser,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
