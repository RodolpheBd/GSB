import 'package:flutter/material.dart';
import 'color_styles.dart';

class TextStyles {
  // Style for headers
  static const TextStyle header = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: ColorStyles.blackColor,
    fontFamily: 'Montserrat',
  );

  // Style for titles
  static const TextStyle firstTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: ColorStyles.blackColor,
    fontFamily: 'JetBrainsMono',
  );

  // Style for body text
  static const TextStyle body = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: ColorStyles.blackColor,
    fontFamily: 'JetBrainsMono',
  );

  // Style for bold text
  static TextStyle bodyBold(bool isBlackBackground) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color:
          isBlackBackground ? ColorStyles.whiteColor : ColorStyles.blackColor,
      fontFamily: 'JetBrainsMono',
    );
  }

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
