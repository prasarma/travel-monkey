import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'swipe_trip_location_widget.dart' show SwipeTripLocationWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeTripLocationModel extends FlutterFlowModel<SwipeTripLocationWidget> {
  ///  Local state fields for this page.

  double progressValue = 0.0;

  int count = 0;

  double totalRecordCount = 0.00;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in SwipeTripLocation widget.
  List<PlacesRecord>? placesList;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
