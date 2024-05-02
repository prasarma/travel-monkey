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

import 'package:table_calendar/table_calendar.dart';

class RangeCalendar extends StatefulWidget {
  const RangeCalendar({
    Key? key,
    this.width,
    this.height,
    required this.rangeColor,
    required this.rangeDuration,
    required this.isWeekendIncluded,
    required this.setDate,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color rangeColor;
  final int rangeDuration;
  final bool isWeekendIncluded;
  final Future<dynamic> Function() setDate;

  @override
  _RangeCalendarState createState() => _RangeCalendarState();
}

class _RangeCalendarState extends State<RangeCalendar> {
  DateTime selectedDate = DateTime.now();

  bool isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  DateTime calculateEndDay() {
    DateTime endDate = selectedDate;
    int daysToAdd = widget.rangeDuration - 1;

    if (!widget.isWeekendIncluded) {
      while (daysToAdd > 0) {
        endDate = endDate.add(Duration(days: 1));

        if (!isWeekend(endDate)) {
          daysToAdd--;
        }
      }
    } else {
      endDate = endDate.add(Duration(days: widget.rangeDuration - 1));
    }
    return endDate;
  }

  Map<DateTime, List<Decoration>> generateDateDecorations() {
    Map<DateTime, List<Decoration>> decorations = {};

    if (!widget.isWeekendIncluded) {
      DateTime current = selectedDate;
      DateTime endDate = calculateEndDay();

      while (current.isBefore(endDate)) {
        if (!isWeekend(current)) {
          decorations[current] = [
            BoxDecoration(color: widget.rangeColor, shape: BoxShape.circle)
          ];
        }
        current = current.add(Duration(days: 1));
      }
    }

    return decorations;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: selectedDate,
      firstDay: DateTime.now(),
      lastDay: DateTime.now().add(const Duration(days: 600)),
      calendarFormat: CalendarFormat.month,
      rangeStartDay: selectedDate,
      formatAnimationCurve: Curves.easeIn,
      rangeEndDay: calculateEndDay(),
      holidayPredicate: (day) {
        if (widget.isWeekendIncluded) {
          return true;
        } else {
          return day.weekday == DateTime.saturday ||
              day.weekday == DateTime.sunday;
        }
      },
      onDaySelected: (selectedDay, focusedDay) async {
        setState(() {
          selectedDate = selectedDay;
          FFAppState().selectedStartDate = selectedDay;
          FFAppState().selectedEndDate = calculateEndDay();
        });
        setState(() {});
        // print(FFAppState().fDate);
        await widget.setDate.call();
      },
      calendarStyle: CalendarStyle(
          holidayDecoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          withinRangeDecoration: BoxDecoration(
            color: widget.rangeColor,
            shape: BoxShape.circle,
          ),
          withinRangeTextStyle: TextStyle(
            color: Colors.white,
          ),
          rangeStartDecoration: BoxDecoration(
            color: widget.rangeColor,
            shape: BoxShape.circle,
          ),
          rangeEndDecoration: BoxDecoration(
            color: widget.rangeColor,
            shape: BoxShape.circle,
          ),
          isTodayHighlighted: false),
      daysOfWeekStyle: DaysOfWeekStyle(
          // weekendStyle: TextStyle(
          //   color: Colors.red,
          // ),
          ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
