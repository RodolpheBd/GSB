import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:gsb/src/common/common.dart';

void openCalendarDialog({
  required BuildContext context,
  required DateTime selectedDay,
  required DateTime focusedDay,
  required ValueChanged<DateTime> onDateSelected,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: ColorStyles.whiteColor,
        child: SizedBox(
          width: AppDimensions.widgetWidth,
          height: AppDimensions.widgetLargeHeight,
          child: TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              onDateSelected(selectedDay);
              Navigator.of(context).pop();
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: ColorStyles.blackColor,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(
                color: ColorStyles.whiteColor,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: ColorStyles.blackColor,
                    width: AppDimensions.borderThickness),
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(
                color: ColorStyles.blackColor,
              ),
            ),
          ),
        ),
      );
    },
  );
}
