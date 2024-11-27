import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';
import 'package:gsb/src/widgets/calendar.dart';

class CalendarService {
  Future<void> showDatePickerDialog({
    required BuildContext context,
    required DateTime selectedDay,
    required DateTime focusedDay,
    required Function(DateTime) onDateSelected,
  }) async =>
    await showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: AppColors.whiteColor,
        child: SizedBox(
          width: AppDimensions.widgetWidth,
          height: AppDimensions.calendarHeight,
          child: CustomCalendar(
            selectedDay: selectedDay,
            focusedDay: focusedDay,
            onDateSelected: (DateTime selectedDate) {
              onDateSelected(selectedDate);
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }

