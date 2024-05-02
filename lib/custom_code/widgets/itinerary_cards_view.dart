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

import 'package:geolocator/geolocator.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:url_launcher/url_launcher.dart';

dynamic parseCustomJson(dynamic response, String jsonPath, int index) {
  return response[index][jsonPath];
}

class ItineraryCardsView extends StatefulWidget {
  ItineraryCardsView({
    Key? key,
    this.width,
    this.height,
    required this.index,
  }) : super(key: key);

  final double? width;
  final double? height;
  int index;

  @override
  _ItineraryCardsViewState createState() => _ItineraryCardsViewState();
}

void _launchMaps(LatLng start, LatLng end) async {
  String mapUrl =
      'https://www.google.com/maps/dir/?api=1&origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}';
  if (await canLaunch(mapUrl)) {
    await launch(mapUrl);
  } else {
    throw 'Could not launch $mapUrl';
  }
}

class _ItineraryCardsViewState extends State<ItineraryCardsView> {
  @override
  Widget build(BuildContext context) {
    final dailyActivityData = parseCustomJson(
        FFAppState().tripDetails['trip'], 'activities', widget.index);
    // int dataIndex = 0;
    return Builder(
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              dailyActivityData.length + (dailyActivityData.length - 1),
              (dailyActivityDataIndex) {
            // dataIndex = dailyActivityDataIndex ~/ 2;
            // final dailyActivityDataItem =
            //     dailyActivityData[dailyActivityDataIndex];
            if (dailyActivityDataIndex % 2 == 0) {
              return Padding(
                padding: const EdgeInsets.only(right: 6, top: 6, bottom: 6),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: ActivityCardWidget(
                      activityData:
                          dailyActivityData[dailyActivityDataIndex ~/ 2],
                      key: Key(
                          'Keynl4_${dailyActivityDataIndex}_of_${dailyActivityData.length}'),
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                // padding: const EdgeInsets.only(right: 6, top: 6, bottom: 6),
                child: InkWell(
                  onTap: () {
                    _launchMaps(
                      functions.parseLatLng(
                          dailyActivityData[dailyActivityDataIndex ~/ 2]
                              ['latlng']),
                      functions.parseLatLng(
                        dailyActivityData[dailyActivityDataIndex ~/ 2 + 1]
                            ['latlng'],
                      ),
                    );
                  },
                  child: Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Color(0xffe0eefe),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Row(
                            children: [
                              Icon(Icons.drive_eta_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                calculateTime(
                                  functions.parseLatLng(dailyActivityData[
                                      dailyActivityDataIndex ~/ 2]['latlng']),
                                  functions.parseLatLng(
                                    dailyActivityData[
                                            dailyActivityDataIndex ~/ 2 + 1]
                                        ['latlng'],
                                  ),
                                ),
                                style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 12.0),
                          child: Row(
                            children: [
                              Text(
                                'Directions',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff158cff)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color(0xff158cff),
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
        );
      },
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

String calculateTime(LatLng start, LatLng end) {
  const double averageSpeedKmPerHour = 40.0;

  double distanceInMeters = Geolocator.distanceBetween(
    start.latitude,
    start.longitude,
    end.latitude,
    end.longitude,
  );

  double distanceInKm = distanceInMeters / 1000;
  double timeInHours = distanceInKm / averageSpeedKmPerHour;
  int timeInMinutes = (timeInHours * 60).round();
  int hours = timeInMinutes ~/ 60;
  int minutes = timeInMinutes % 60;

  String timeString = '';
  if (hours > 0) {
    timeString += '${hours}h ';
  } else if (minutes > 0) {
    timeString += '${minutes}m';
  }

  return timeString;
}
