import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gsb/src/utils/utils.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class ShowFees extends StatefulWidget {
  // Changez pour StatefulWidget
  final String documentId;
  final String title;
  final String? image;
  final String date;
  final String number;
  final String price;
  final bool repay;

  const ShowFees({
    super.key,
    required this.title,
    this.image,
    required this.date,
    required this.number,
    required this.price,
    required this.repay,
    required this.documentId,
  });

  @override
  _ShowFeesState createState() => _ShowFeesState();
}

class _ShowFeesState extends State<ShowFees> {
  final TextEditingController _dateValue = TextEditingController();
  final TextEditingController _numberValue = TextEditingController();
  final TextEditingController _priceValue = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateValue.text = widget.date;
    _numberValue.text = widget.number;
    _priceValue.text = widget.price;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: HeaderNavBar(
          showBackArrow: true,
          title: widget.title,
          backgroundColor:
              widget.repay ? ColorStyles.greenColor : ColorStyles.redColor,
        ),
        body: Container(
          color: widget.repay ? ColorStyles.greenColor : ColorStyles.redColor,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: AppDimensions.gapMedium),
                widget.image != null && widget.image!.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.borderRadiusMedium),
                        child: Image.network(
                          widget.image!,
                          fit: BoxFit.cover,
                          height: AppDimensions.widgetLargeHeight,
                          width: AppDimensions.widgetWidth,
                          errorBuilder: (context, error, stackTrace) =>
                              const SizedBox(),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: AppDimensions.gapSmall),
                CustomTextInput(
                  value: _dateValue,
                ),
                const SizedBox(height: AppDimensions.gapSmall),
                CustomTextInput(
                  value: _numberValue,
                ),
                const SizedBox(height: AppDimensions.gapSmall),
                CustomTextInput(
                  value: _priceValue,
                ),
                const SizedBox(height: AppDimensions.gapSmall),
                CustomButton(
                  text: 'Valider',
                  textColor: widget.repay
                      ? ColorStyles.greenColor
                      : ColorStyles.redColor,
                  onPressed: () => FirestoreService.handleAction(
                    context: context,
                    actionType: 'update',
                    documentId: widget.documentId,
                    date: _dateValue.text,
                    number: _numberValue.text,
                    price: _priceValue.text,
                    title: widget.title,
                  ),
                ),
                const SizedBox(height: AppDimensions.gapSmall),
                CustomButton(
                  text: 'Supprimer',
                  textColor: widget.repay
                      ? ColorStyles.greenColor
                      : ColorStyles.redColor,
                  onPressed: () => FirestoreService.handleAction(
                    // Utilisation du service Firestore
                    context: context,
                    actionType: 'delete',
                    documentId: widget.documentId,
                    date: '',
                    number: '', // Non utilisé pour la suppression
                    price: '', // Non utilisé pour la suppression
                    title: '', // Non utilisé pour la suppression
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
