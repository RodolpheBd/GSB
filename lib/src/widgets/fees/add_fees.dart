import 'package:flutter/material.dart';
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
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.title,
          style: TextStyles.header,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.gapMedium),
            CustomCard(
              icon: widget.icon,
              height: AppDimensions.widgetMediumHeight,
              width: AppDimensions.widgetWidth,
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
              onPressed: () => (/* ton code ici */),
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
