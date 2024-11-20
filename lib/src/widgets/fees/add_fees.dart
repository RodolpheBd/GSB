import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gsb/src/utils/utils.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class AddFees extends StatefulWidget {
  final String title;
  final String icon;
  final String textInput;

  const AddFees({
    super.key,
    required this.title,
    required this.icon,
    required this.textInput,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AddFeesState createState() => _AddFeesState();
}

class _AddFeesState extends State<AddFees> {
  final TextEditingController _dateValue = TextEditingController();
  final TextEditingController _numberValue= TextEditingController();
  final TextEditingController _priceValue= TextEditingController();
  XFile? _selectedImage;

  Future<void> _pickImage() async =>
      await ImagePicker().pickImage(source: ImageSource.gallery).then((image) =>
          image != null ? setState(() => _selectedImage = image) : null);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: HeaderNavBar(
          showBackArrow: true,
          title: widget.title,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: AppDimensions.gapMedium),
              _selectedImage == null
                  ? CustomCard(
                      icon: widget.icon,
                      height: AppDimensions.widgetLargeHeight,
                      width: AppDimensions.widgetWidth,
                      onPressed: () => _pickImage(),
                    )
                  : ImageService.displayImage(_selectedImage!),
              const SizedBox(height: AppDimensions.gapSmall),
              GestureDetector(
                onTap: () => DateService.showDatePickerDialog(
                  context,
                  onDateSelected: (DateTime selectedDate) => {
                    DateService.updateSelectedDate(
                        selectedDate, _dateValue),
                    Navigator.of(context).pop(),
                  },
                ),
                child: AbsorbPointer(
                  child: CustomTextInput(
                    value: _dateValue,
                    placeholder: "Saisir date",
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomTextInput(
                value: _numberValue,
                placeholder: widget.textInput,
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomTextInput(
                value: _priceValue,
                placeholder: 'Saisir montant (H.T./F)',
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomButton(
                text: 'Télécharger une image',
                onPressed: () => _pickImage(),
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomButton(
                text: 'Valider',
                onPressed: () => {
                  FirebaseFirestore.instance.collection('Fees').add({
                    'title': widget.title,
                    'date': _dateValue.text,
                    'number': _numberValue.text,
                    'price': _priceValue.text,
                    'image': _selectedImage?.path ?? 'Pas de justificatif',
                    'repay': false,
                  }),
                },
              ),
            ],
          ),
        ),
      );
}
