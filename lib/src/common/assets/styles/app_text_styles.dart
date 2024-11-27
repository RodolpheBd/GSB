import 'package:flutter/material.dart';

class AppTextStyles {
  // Style for headers
  static const TextStyle header = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
  );

  // Style for titles
  static const TextStyle firstTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    fontFamily: 'JetBrainsMono',
  );

  // Style for body text
  static const TextStyle body = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: 'JetBrainsMono',
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'JetBrainsMono',
  );

  // Style for calendar
  static const TextStyle headerCalendar = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
  );
  static const TextStyle titleCalendar = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );
  static const TextStyle bodyCalendar = TextStyle(
    fontFamily: 'JetBrainsMono',
  );
}
