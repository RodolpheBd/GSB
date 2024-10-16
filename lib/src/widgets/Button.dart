import 'package:flutter/material.dart';
import '../styles/TextStyles.dart';
import '../styles/ColorStyles.dart';
import '../styles/DimensionStyles.dart';

class Button extends StatelessWidget {
  final String text;
  final bool isBlackBackground;
  // Callback appelé lorsque le bouton est pressé
  final VoidCallback onPressed;

  // Constructeur du widget avec des paramètres requis
  const Button({
    super.key, 
    required this.text,
    required this.isBlackBackground,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DimensionStyles.composantHeight, // Hauteur du bouton
      width: DimensionStyles.composantWidth, // Largeur du bouton
      child: ElevatedButton(
        onPressed: onPressed, // Action à effectuer lorsque le bouton est pressé
        style: ElevatedButton.styleFrom(
          backgroundColor: isBlackBackground ? ColorStyles.secondaryColor : ColorStyles.primaryColor, // Couleur de fond du bouton
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DimensionStyles.borderRadius), // Bordure arrondie
            side: BorderSide(
              color: isBlackBackground ? ColorStyles.secondaryColor : ColorStyles.primaryColor, // Couleur de la bordure
            ),
          ),
        ),
        child: Text(
          text, // Texte affiché sur le bouton
          style: TextStyles.bodyBold(isBlackBackground), // Style du texte
        ),
      ),
    );
  }
}
