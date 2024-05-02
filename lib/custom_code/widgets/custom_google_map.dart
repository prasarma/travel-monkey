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

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomMapPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int placeIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  late gmap.GoogleMapController mapController;

  moveCameraToMarker(int index) {
    final latLng = parseLatLng(FFAppState().tmpLatLng[index]);
    mapController.animateCamera(
      gmap.CameraUpdate.newCameraPosition(
        gmap.CameraPosition(
          target: gmap.LatLng(latLng.latitude, latLng.longitude),
          zoom: 14,
        ),
      ),
    );
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CustomGoogleMapState createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late CustomMapPageModel _model;
  // Iterable markers = [];
  // Iterable polylines = [];
  @override
  void initState() {
    // addCustomIcon();
    _model = createModel(context, () => CustomMapPageModel());

    super.initState();
  }

  Iterable<gmap.Marker> markers =
      Iterable.generate(FFAppState().tmpLatLng.length, (index) {
    return gmap.Marker(
      markerId: gmap.MarkerId(FFAppState().tmpLatLng[index]),
      position: parseLatLng(FFAppState().tmpLatLng[index]),
      infoWindow: gmap.InfoWindow(title: FFAppState().tmpLatLng[index]),
      // icon: markerIcon,
    );
  });
  Iterable<gmap.Polyline?> polylines =
      Iterable.generate(FFAppState().tmpLatLng.length, (index) {
    if (index + 1 != FFAppState().tmpLatLng.length) {
      return gmap.Polyline(
          endCap: gmap.Cap.roundCap,
          startCap: gmap.Cap.roundCap,
          geodesic: false,
          width: 2,
          patterns: [gmap.PatternItem.dash(10), gmap.PatternItem.gap(10)],

          // patterns: [PatternItem.dash(10), PatternItem.gap(10)],
          polylineId: gmap.PolylineId(FFAppState().tmpLatLng[index]),
          points: [
            parseLatLng(FFAppState().tmpLatLng[index]),
            parseLatLng(FFAppState().tmpLatLng[index + 1])
          ]);
    }
    return const gmap.Polyline(polylineId: gmap.PolylineId(''));
  });

  gmap.BitmapDescriptor markerIcon = gmap.BitmapDescriptor.defaultMarker;

  // void addCustomIcon() {
  //   gmap.BitmapDescriptor.fromAssetImage(
  //     const ImageConfiguration(size: Size(20, 40)),
  //     "assets/images/${widget.imageName}",
  //   ).then(
  //     (icon) {
  //       setState(() {
  //         markerIcon = icon;
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: gmap.GoogleMap(
              onMapCreated: (controller) {
                _model.mapController = controller;
              },
              polylines: Set.from(polylines),
              markers: Set.from(markers),
              initialCameraPosition: gmap.CameraPosition(
                target: parseLatLng(FFAppState().tmpLatLng[0]),
                zoom: 14,
              ),
              // ToDO: add markers
            )),
        Positioned(
          top: 60,
          left: 18,
          child: Material(
            shape: const CircleBorder(),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Icon(Icons.arrow_back_ios_new_rounded,
                      size: 22, color: FlutterFlowTheme.of(context).accent1),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.00, 1.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 36.0),
            child: Builder(
              builder: (context) {
                final activity =
                    FFAppState().tmpDailyTripData.map((e) => e).toList();
                return Material(
                  color: Colors.transparent,
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 100.0,
                    child: CarouselSlider.builder(
                      itemCount: activity.length,
                      itemBuilder: (context, activityIndex, _) {
                        final activityItem = activity[activityIndex];
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).info,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x3C000000),
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 0.0, 12.0),
                                child: Container(
                                  width: 80.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                              activityItem['images'][0])
                                          .image,
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).primary,
                                        FlutterFlowTheme.of(context).secondary
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(1.0, 0.0),
                                      end: AlignmentDirectional(-1.0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    activityItem['place_name'],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Merriweather',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 18.0,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      RatingBarIndicator(
                                        itemBuilder: (context, index) => FaIcon(
                                          FontAwesomeIcons.solidStar,
                                          color: Color(0xffFFA534),
                                        ),
                                        direction: Axis.horizontal,
                                        rating: activityItem['rating'] / 2,
                                        unratedColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        itemCount: 5,
                                        itemSize: 16.0,
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.solidClock,
                                        color: Color(0xff158cff),
                                        size: 16.0,
                                      ),
                                      Text(
                                        activityItem['time_to_visit'],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        );
                      },
                      carouselController: _model.carouselController ??=
                          CarouselController(),
                      options: CarouselOptions(
                        initialPage: min(1, activity.length - 1),
                        viewportFraction: 0.75,
                        disableCenter: true,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.25,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: false,
                        onPageChanged: (index, _) async {
                          _model.carouselCurrentIndex = index;
                          FFAppState().update(() {
                            FFAppState().placeIndex =
                                _model.carouselCurrentIndex;
                          });

                          _model
                              .moveCameraToMarker(_model.carouselCurrentIndex);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

gmap.LatLng parseLatLng(String toParse) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  final latLngSplit = toParse.split(",");
  return gmap.LatLng(
    double.parse(latLngSplit[0]),
    double.parse(latLngSplit[1]),
  );

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
