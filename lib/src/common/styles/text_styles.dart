import 'package:flutter/material.dart';
import 'color_styles.dart';

class TextStyles {
  // Style pour les en-têtes
  static const TextStyle header = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: ColorStyles.blackColor,
    fontFamily: 'Montserrat',
  );

  // Style pour les titres
  static const TextStyle firstTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: ColorStyles.blackColor,
    fontFamily: 'JetBrainsMono',
  );

  // Style pour les textes
  static const TextStyle body = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: ColorStyles.blackColor,
    fontFamily: 'JetBrainsMono',
  );

  // Style pour les textes en gras
  static TextStyle bodyBold(bool isBlackBackground) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color:
          isBlackBackground ? ColorStyles.whiteColor : ColorStyles.blackColor,
      fontFamily: 'JetBrainsMono',
    );
  }

  // Style pour les calendriers
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
