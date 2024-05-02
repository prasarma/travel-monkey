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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import '../../components/detail_box_widget.dart';
import '../../components/generate_a_i_widget.dart';
import '../../components/search_city_widget.dart';
import '../../components/search_top_five_widget.dart';
import '../../components/video_player_map_widget.dart';

import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';

import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlong;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;
import 'package:travel_monkey/components/detail_box_tile2_widget.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  int _markerIdCounter = 1;
  bool showCityLevelSearch = true;
  bool showTopFiveSearch = false;
  bool showGenerateAI = false;
  bool showVideoPlayer = true;
  bool showDetailsView = false;
  dynamic lastAnimatedMarker;
  dynamic selectedMarkerData;
  BitmapDescriptor? selectActivityMarkerIcon;
  BitmapDescriptor? unSelectActivityMarkerIcon;
  BitmapDescriptor? selectHotelMarkerIcon;
  BitmapDescriptor? unSelectHotelMarkerIcon;
  BitmapDescriptor? selectRestaurantsMarkerIcon;
  BitmapDescriptor? unSelectRestaurantsMarkerIcon;

  String markerImageBaseUrl =
      "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/";

  late ScrollController scrollController;
  SlidingUpPanelController panelController = SlidingUpPanelController();

  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: latlong.LatLng(20.5937, 78.9629),
    zoom: 0.0,
  );

  final CameraTargetBounds _cameraTargetBounds = CameraTargetBounds.unbounded;
  MapType _mapType = MapType.normal;
  late GoogleMapController _controller;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.expand();
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.anchor();
      } else {}
    });
    super.initState();
    getMarkerIcons();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            child: GoogleMap(
              onMapCreated: onMapCreated,
              markers: Set<Marker>.of(markers.values),
              initialCameraPosition: _kInitialPosition,
              compassEnabled: false,
              mapToolbarEnabled: false,
              cameraTargetBounds: _cameraTargetBounds,
              mapType: _mapType,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
            ),
          ),
          if (showVideoPlayer)
            const Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomVideoPlayer(
                  width: double.infinity,
                  height: double.infinity,
                )),
          if (showCityLevelSearch)
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 300),
                child: Align(
                  alignment: Alignment.center,
                  child: SearchCityWidget(
                    list:
                        functions.convertJsonToJsonList(FFAppState().cityData),
                    onSearch: () async {
                      setState(() {
                        showCityLevelSearch = false;
                        showTopFiveSearch = true;
                        // showVideoPlayer = true;
                      });

                      cityLevelZoom(FFAppState().selectedCityData);
                    },
                  ),
                ),
              ),
            ),
          if (showTopFiveSearch)
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: SearchTopFiveWidget(
                    onSearch: () async {
                      setState(() {
                        showCityLevelSearch = false;
                        showTopFiveSearch = false;
                        showGenerateAI = true;
                      });
                    },
                  ),
                ),
              ),
            ),
          if (showGenerateAI)
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: GenerateAIWidget(
                  action: () async {
                    setState(() {
                      showCityLevelSearch = false;
                      showTopFiveSearch = false;
                      showGenerateAI = false;
                    });

                    FFAppState().selectedTopFive.forEach((element) {
                      _addMarker(element);
                    });
                  },
                ),
              ),
            ),
          if (showDetailsView) newSlideView(),
        ],
      ),
    );
  }

  getMarkerIcons() {
    getMarkerBytes("${markerImageBaseUrl}5z5e02piz54e/res_b.png").then((value) {
      setState(() {
        selectRestaurantsMarkerIcon = value;
      });
    });

    getMarkerBytes("${markerImageBaseUrl}moqcccr3uykp/res_s.png").then((value) {
      setState(() {
        unSelectRestaurantsMarkerIcon = value;
      });
    });

    getMarkerBytes("${markerImageBaseUrl}ay3u22v29bdk/hotel_b.png")
        .then((value) {
      setState(() {
        selectHotelMarkerIcon = value;
      });
    });

    getMarkerBytes("${markerImageBaseUrl}1is0831e5p7f/hotel_s.png")
        .then((value) {
      setState(() {
        unSelectHotelMarkerIcon = value;
      });
    });

    getMarkerBytes("${markerImageBaseUrl}pjsqvzdp2dsg/holidayb.png")
        .then((value) {
      setState(() {
        selectActivityMarkerIcon = value;
      });
    });

    getMarkerBytes("${markerImageBaseUrl}9cudeap1dlp0/holiday_s.png")
        .then((value) {
      setState(() {
        unSelectActivityMarkerIcon = value;
      });
    });
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
  }

  cityLevelZoom(dynamic data) {
    latlong.LatLng myLocation =
        latlong.LatLng(data["lat"], data["log"]); // New York, NY

    // Create a new camera position
    CameraPosition newPosition = CameraPosition(
      target: myLocation,
      zoom: 12.0, // You can adjust the zoom level
    );
    // Move the camera to the new position
    //  _mapType = MapType.normal;
    _controller.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }

  void _addMarker(dynamic data) async {
    final int markerCount = markers.length;
    BitmapDescriptor markerIcon = findMarkerImage(data["place_type"], false);
    latlong.LatLng latLong = latlong.LatLng(data["lat"], data["log"]);

    final String markerIdVal = 'marker_id_${data['id']}';
    final MarkerId markerId = MarkerId(markerIdVal);

    if (markers.containsKey(markerId)) {
      markers.remove(markerId);
    }

    final Marker marker = Marker(
      markerId: markerId,
      icon: markerIcon,
      position: latlong.LatLng(
        latLong.latitude + sin(_markerIdCounter * pi / 6.0) / 20.0,
        latLong.longitude + cos(_markerIdCounter * pi / 6.0) / 20.0,
      ),
      // infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () {
        mapAction(data);
      },
      // onDragEnd: (LatLng position) => _onMarkerDragEnd(markerId, position),
      // onDrag: (LatLng position) => _onMarkerDrag(markerId, position),
    );

    setState(() {
      markers[markerId] = marker;
    });
    _fitMarkers();
  }

  void _resizeMarker(dynamic data) async {
    final int markerCount = markers.length;
    BitmapDescriptor markerIcon = findMarkerImage(data["place_type"], true);
    latlong.LatLng latLong = latlong.LatLng(data["lat"], data["log"]);

    if (lastAnimatedMarker != null) {
      _addMarker(lastAnimatedMarker);
    }

    final String markerIdVal = 'marker_id_${data['id']}';
    final MarkerId markerId = MarkerId(markerIdVal);

    Marker oldMarker = markers[markerId]!;

    markers.remove(oldMarker);

    final Marker marker = Marker(
      markerId: markerId,
      icon: markerIcon!,
      position: latlong.LatLng(
        latLong.latitude + sin(_markerIdCounter * pi / 6.0) / 20.0,
        latLong.longitude + cos(_markerIdCounter * pi / 6.0) / 20.0,
      ),
      // infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () {
        mapAction(data);
      },
      // onDragEnd: (LatLng position) => _onMarkerDragEnd(markerId, position),
      // onDrag: (LatLng position) => _onMarkerDrag(markerId, position),
    );

    setState(() {
      lastAnimatedMarker = data;
      markers[markerId] = marker;
    });
    _fitMarkers();
  }

  mapAction(dynamic data) async {
    if (data != lastAnimatedMarker) {
      _resizeMarker(data);
    }

    setState(() {
      selectedMarkerData = data;
      showDetailsView = true;
    });
  }

  BitmapDescriptor findMarkerImage(String type, bool isSelectIcon) {
    BitmapDescriptor? icon;

    switch (type) {
      case "Restaurant":
        icon = isSelectIcon
            ? selectRestaurantsMarkerIcon
            : unSelectRestaurantsMarkerIcon;
        break;

      case "Activity":
        icon = isSelectIcon
            ? selectActivityMarkerIcon
            : unSelectActivityMarkerIcon;
        break;

      case "Hotel":
        icon = isSelectIcon ? selectHotelMarkerIcon : unSelectHotelMarkerIcon;
        break;
    }

    return icon!;
  }

  void _fitMarkers() {
    if (markers.isEmpty) return;

    // Calculate the bounds that include all markers
    latlong.LatLngBounds bounds = _calculateBounds();

    // Animate the camera to fit the bounds
    _controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100.0));
  }

  // Function to calculate the bounds that include all markers
  latlong.LatLngBounds _calculateBounds() {
    double minLat = double.infinity;
    double maxLat = -double.infinity;
    double minLng = double.infinity;
    double maxLng = -double.infinity;

    markers.forEach((key, value) {
      double lat = value.position.latitude;
      double lng = value.position.longitude;

      minLat = min(minLat, lat);
      maxLat = max(maxLat, lat);
      minLng = min(minLng, lng);
      maxLng = max(maxLng, lng);
    });

    return latlong.LatLngBounds(
      southwest: latlong.LatLng(minLat, minLng),
      northeast: latlong.LatLng(maxLat, maxLng),
    );
  }

  slideView() {
    return SlidingUpPanel(
      minHeight: MediaQuery.of(context).size.height * .40,
      maxHeight: MediaQuery.of(context).size.height,
      backdropTapClosesPanel: true,
      backdropEnabled: true,
      onPanelClosed: () {
        showDetailsView = false;
      },
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      isDraggable: true,
      panelBuilder: (sc) {
        return ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Icon(
                Icons.maximize_outlined,
                color: Colors.grey,
                size: 50,
              ),
            ),
            Column(
              children: [
                DetailBoxTile2Widget(
                  data: selectedMarkerData,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  newSlideView() {
    return SlidingUpPanelWidget(
      panelController: panelController,
      anchor: 0.5,
      controlHeight: MediaQuery.of(context).size.height * .4,
      onTap: () {
        print("dsadasdsad");
      },
      child: Container(
        decoration: const ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(
                blurRadius: 5.0, spreadRadius: 2.0, color: Color(0x11000000))
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Icon(
                Icons.maximize_outlined,
                color: Colors.grey,
                size: 50,
              ),
            ),
            Flexible(
              child: ListView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  DetailBoxTile2Widget(
                    data: selectedMarkerData,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<BitmapDescriptor> getMarkerBytes(String imageUrl) async {
    final http.Response response = await http.get(Uri.parse(imageUrl));
    final Uint8List bytes = response.bodyBytes;

    // ui.Codec codec = await ui.instantiateImageCodec(bytes, targetWidth: width);
    // ui.FrameInfo fi = await codec.getNextFrame();
    // final Uint8List markerIcon =
    //     (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
    //         .buffer
    //         .asUint8List();

    return BitmapDescriptor.fromBytes(bytes);
  }
}
