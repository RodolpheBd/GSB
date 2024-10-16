import 'package:flutter/material.dart';
import '../styles/TextStyles.dart';
import '../styles/ColorStyles.dart';
import '../styles/DimensionStyles.dart';

class TextInput extends StatelessWidget {
  final String placeholder;

  // Constructeur du widget avec un placeholder requis
  const TextInput({
    super.key, 
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: DimensionStyles.composantHeight, // Hauteur du TextInput
          width: DimensionStyles.composantWidth, // Largeur du TextInput
          child: TextField(
            decoration: InputDecoration(
              hintText: placeholder, // Placeholder
              hintStyle: TextStyles.body,  // Applique la police spécifiée au placeholder aussi
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(DimensionStyles.borderRadius)), // Bordure arrondie
                borderSide: BorderSide(
                  color: ColorStyles.secondaryColor, // Couleur de la bordure
                  width: DimensionStyles.borderThickness, // Épaisseur de la bordure
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(DimensionStyles.borderRadius)),
                borderSide: BorderSide(
                  color: ColorStyles.secondaryColor, 
                  width: DimensionStyles.borderThickness,
                ),
              ),
            ),
            style: TextStyles.body // Applique la police spécifiée au texte saisi
          ),
        ),
      ],
    );
  }
}
