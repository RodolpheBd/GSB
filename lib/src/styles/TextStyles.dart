import 'package:flutter/material.dart';
import '../styles/ColorStyles.dart';

class TextStyles {
    // Style pour les en-têtes
    static const TextStyle header = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: ColorStyles.secondaryColor,
      fontFamily: 'Montserrat',
    );

    // Style pour les titres
    static const TextStyle firstTitle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: ColorStyles.secondaryColor,
      fontFamily: 'JetBrainsMono',
    );

    // Style pour les textes
    static const TextStyle body = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: ColorStyles.secondaryColor,
      fontFamily: 'JetBrainsMono',
    );

    // Style pour les textes en gras
    static TextStyle bodyBold(bool isBlackBackground) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: isBlackBackground ? ColorStyles.primaryColor : ColorStyles.secondaryColor,
      fontFamily: 'JetBrainsMono',
    );
  }
}
