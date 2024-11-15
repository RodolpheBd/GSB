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
  final TextEditingController _dateController = TextEditingController();
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
                        selectedDate, _dateController),
                    Navigator.of(context).pop(),
                  },
                ),
                child: AbsorbPointer(
                  child: CustomTextInput(
                    value: _dateController,
                    placeholder: "Saisir date",
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomTextInput(
                placeholder: widget.textInput,
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomTextInput(
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
                onPressed: () => {/* ton code ici */},
              ),
            ],
          ),
        ),
      );
}
