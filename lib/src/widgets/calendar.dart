import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:gsb/src/common/common.dart';

class CustomCalendar extends StatefulWidget {
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
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.selectedDay;
    _focusedDay = widget.focusedDay;
  }

  @override
  Widget build(BuildContext context) => TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          widget.onDateSelected(selectedDay);
        },
        availableCalendarFormats: const {CalendarFormat.month: 'Month'},
        headerStyle: _headerStyle(),
        calendarStyle: _calendarStyle(),
        daysOfWeekStyle: _daysOfWeekStyle(),
      );

  HeaderStyle _headerStyle() => HeaderStyle(
        titleCentered: true,
        titleTextStyle: AppTextStyles.headerCalendar,
        leftChevronIcon: const Icon(Icons.chevron_left),
        rightChevronIcon: const Icon(Icons.chevron_right),
      );

  CalendarStyle _calendarStyle() => CalendarStyle(
        defaultTextStyle: AppTextStyles.bodyCalendar,
        selectedDecoration: BoxDecoration(
          color: AppColors.blackColor,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: const TextStyle(color: Colors.white),
        todayDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: AppColors.blackColor,
            width: AppDimensions.borderThickness,
          ),
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(color: AppColors.blackColor),
      );

  DaysOfWeekStyle _daysOfWeekStyle() => DaysOfWeekStyle(
        weekdayStyle: AppTextStyles.titleCalendar,
        weekendStyle: AppTextStyles.titleCalendar,
      );
}
