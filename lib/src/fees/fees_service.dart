import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:gsb/src/imports.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class Fees extends StatefulWidget {
  final String title;
  final String icon;
  final String textInput;

  const Fees({
    super.key,
    required this.title,
    required this.icon,
    required this.textInput,
  });

  @override
  _FeesState createState() => _FeesState();
}

class _FeesState extends State<Fees> {
  final TextEditingController _dateValue = TextEditingController();
  final TextEditingController _numberValue = TextEditingController();
  final TextEditingController _priceValue = TextEditingController();
  XFile? _selectedImage;
  bool _isLoading = false;

  Future<void> _pickImage() async =>
      await ImagePicker().pickImage(source: ImageSource.gallery).then((image) =>
          (image != null) ? setState(() => _selectedImage = image) : null);

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
              (_selectedImage) == null
                  ? CustomCard(
                      icon: widget.icon,
                      height: AppDimensions.widgetLargeHeight,
                      width: AppDimensions.widgetWidth,
                      onPressed: () => _pickImage(),
                    )
                  : ImageService.displayImage(_selectedImage!),
              const SizedBox(height: AppDimensions.gapSmall),
              
              GestureDetector(
                onTap: () async {
                  DateTime initialDate = _dateValue.text.isEmpty
                      ? DateTime.now()
                      : DateFormat('dd-MM-yyyy').parse(_dateValue.text);

                  await CalendarService().showDatePickerDialog(
                    context: context,
                    selectedDay: initialDate,
                    focusedDay: DateTime.now(),
                    onDateSelected: (DateTime selectedDate) {
                      setState(() {
                        _dateValue.text = DateFormat('dd-MM-yyyy')
                            .format(selectedDate);
                      });
                    },
                  );
                },
                child: AbsorbPointer(
                  child: CustomTextInput(
                    controller: _dateValue,
                    placeholder: "Saisir date",
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomTextInput(
                controller: _numberValue,
                placeholder: widget.textInput,
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomTextInput(
                controller: _priceValue,
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
                isLoading: _isLoading,
                onPressed: () async {
                  setState(() => _isLoading = true);
                  await FirestoreService.handleAction(
                    context: context,
                    actionType: 'add',
                    documentId: '',
                    title: widget.title,
                    date: _dateValue.text,
                    number: _numberValue.text,
                    price: _priceValue.text,
                    imagePath: _selectedImage?.path,
                  );
                  setState(() => _isLoading = false);
                },
              ),
            ],
          ),
        ),
      );
}
