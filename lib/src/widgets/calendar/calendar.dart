import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:gsb/src/common/common.dart';

class CustomCalendar extends StatelessWidget {
  final DateTime selectedDay;
  final DateTime focusedDay;
  final ValueChanged<DateTime> onDateSelected;

  const CustomCalendar({
    super.key,
    required this.selectedDay,
    required this.focusedDay,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        onDateSelected(selectedDay);
      },
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      headerStyle: _buildHeaderStyle(),
      calendarStyle: _buildCalendarStyle(),
      daysOfWeekStyle: _buildDaysOfWeekStyle(),
    );
  }

  HeaderStyle _buildHeaderStyle() {
    return HeaderStyle(
      titleCentered: true,
      titleTextStyle: TextStyles.headerCalendar,
      leftChevronIcon: Icon(Icons.chevron_left),
      rightChevronIcon: Icon(Icons.chevron_right),
    );
  }

  CalendarStyle _buildCalendarStyle() {
    return CalendarStyle(
      defaultTextStyle: TextStyles.bodyCalendar,
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
          width: AppDimensions.borderThickness,
        ),
        shape: BoxShape.circle,
      ),
      todayTextStyle: TextStyle(
        color: ColorStyles.blackColor,
      ),
    );
  }

  DaysOfWeekStyle _buildDaysOfWeekStyle() {
    return DaysOfWeekStyle(
      weekdayStyle: TextStyles.titleCalendar,
      weekendStyle: TextStyles.titleCalendar,
    );
  }
}
