import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';
import 'package:image_picker/image_picker.dart';

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
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final TextEditingController _dateController = TextEditingController();
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderNavBar(
        showBackArrow: true,
        title: widget.title,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.gapMedium),
            _image == null
    ? CustomCard(
        icon: widget.icon,
        height: AppDimensions.widgetMediumHeight,
        width: AppDimensions.widgetWidth,
      )
    : ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
        child: kIsWeb
            ? Image.network(
                _image!.path,
                height: AppDimensions.widgetMediumHeight,
                width: AppDimensions.widgetWidth,
                fit: BoxFit.cover,
              )
            : Image.file(
                File(_image!.path),
                height: AppDimensions.widgetMediumHeight,
                width: AppDimensions.widgetWidth,
                fit: BoxFit.cover,
              ),
      ),
            const SizedBox(height: AppDimensions.gapSmall),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: ColorStyles.whiteColor,
                      child: SizedBox(
                        width: AppDimensions.widgetWidth,
                        height: AppDimensions.widgetLargeHeight,
                        child: CustomCalendar(
                          selectedDay: _selectedDay,
                          focusedDay: _focusedDay,
                          onDateSelected: (selectedDate) {
                            setState(() {
                              _selectedDay = selectedDate;
                              _focusedDay = selectedDate;
                            });
                            _dateController.text =
                                "${_selectedDay.toLocal()}".split(' ')[0];
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: CustomTextInput(
                  controller: _dateController,
                  placeholder: "Saisir la date",
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.gapSmall),
            CustomTextInput(
              placeholder: widget.textInput,
            ),
            const SizedBox(height: AppDimensions.gapSmall),
            CustomButton(
              text: 'Télécharger une image',
              isBlackBackground: true,
              onPressed: _pickImage,
            ),
            const SizedBox(height: AppDimensions.gapSmall),
            CustomButton(
              text: 'Valider',
              isBlackBackground: true,
              onPressed: () => (/* ton code ici */),
            ),
          ],
        ),
      ),
    );
  }
}