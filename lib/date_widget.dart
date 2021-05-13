/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;
  final Color? originColor;
  final bool isDeactivated;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
    this.originColor,
    this.isDeactivated = true,
  });

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 5.5, right: 5.5,),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(new DateFormat("E", locale).format(date).toUpperCase(), // WeekDay
                style: TextStyle(fontSize: 14, color: Color(0xFF666666),),),
            Container(
              width: width,
              height: width,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(width!/2)),
                color: selectionColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text((date.year == DateTime.now().year && date.month == DateTime.now().month && date.day == DateTime.now().day) ? '今天' : date.day.toString(), // Date
                      style: dateTextStyle),
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: !isDeactivated ? originColor : Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            
            // Text(new DateFormat("MMM", locale).format(date).toUpperCase(), // Month
            //     style: monthTextStyle),
          ],
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(this.date);
        }
      },
    );
  }
}
