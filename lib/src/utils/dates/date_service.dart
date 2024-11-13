import 'package:flutter/material.dart';
import 'package:gsb/src/widgets/calendar/calendar.dart';
import 'package:gsb/src/common/common.dart';

class DateService {
  static DateTime selectedDay = DateTime.now();
  static DateTime focusedDay = DateTime.now();

  static String formatDate(DateTime date) => "${date.toLocal()}".split(' ')[0];

  static Future<void> showDatePickerDialog(
    BuildContext context, {
    required Function(DateTime) onDateSelected,
  }) async =>
      showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: ColorStyles.whiteColor,
          child: SizedBox(
            width: AppDimensions.widgetWidth,
            height: AppDimensions.widgetLargeHeight,
            child: CustomCalendar(
              selectedDay: selectedDay,
              focusedDay: focusedDay,
              onDateSelected: onDateSelected,
            ),
          ),
        ),
      );

  static void updateSelectedDate(
          DateTime newDate, TextEditingController controller) =>
      (
        selectedDay = newDate,
        focusedDay = newDate,
        controller.text = formatDate(newDate),
      );
}
