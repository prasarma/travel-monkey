import '/flutter_flow/flutter_flow_util.dart';
import '/tobedelete/activity_header_chips/activity_header_chips_widget.dart';
import '/tobedelete/hotel_header_chips/hotel_header_chips_widget.dart';
import '/tobedelete/restaurent_header_chips/restaurent_header_chips_widget.dart';
import 'detail_box_tile2_widget.dart' show DetailBoxTile2Widget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DetailBoxTile2Model extends FlutterFlowModel<DetailBoxTile2Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for HotelHeaderChips component.
  late HotelHeaderChipsModel hotelHeaderChipsModel;
  // Model for ActivityHeaderChips component.
  late ActivityHeaderChipsModel activityHeaderChipsModel;
  // Model for RestaurentHeaderChips component.
  late RestaurentHeaderChipsModel restaurentHeaderChipsModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {
    hotelHeaderChipsModel = createModel(context, () => HotelHeaderChipsModel());
    activityHeaderChipsModel =
        createModel(context, () => ActivityHeaderChipsModel());
    restaurentHeaderChipsModel =
        createModel(context, () => RestaurentHeaderChipsModel());
  }

  @override
  void dispose() {
    hotelHeaderChipsModel.dispose();
    activityHeaderChipsModel.dispose();
    restaurentHeaderChipsModel.dispose();
    expandableExpandableController.dispose();
  }
}
