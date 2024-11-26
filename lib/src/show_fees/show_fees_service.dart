import 'package:flutter/material.dart';
import 'package:gsb/src/imports.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class ShowFeesService extends StatefulWidget {
  final String documentId;
  final String title;
  final String? image;
  final String date;
  final String number;
  final String price;
  final bool repay;

  const ShowFeesService({
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
  _ShowFeesServiceState createState() => _ShowFeesServiceState();
}

class _ShowFeesServiceState extends State<ShowFeesService> {
  final TextEditingController _dateValue = TextEditingController();
  final TextEditingController _numberValue = TextEditingController();
  final TextEditingController _priceValue = TextEditingController();
  bool _isLoadingValidate = false;
  bool _isLoadingDelete = false;

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
                (widget.image != null && widget.image!.isNotEmpty)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.borderRadiusSmall),
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
                  controller: _dateValue,
                  placeholder: 'Saisir date',
                ),
                const SizedBox(height: AppDimensions.gapSmall),
                CustomTextInput(
                  controller: _numberValue,
                  placeholder: 'Saisir valeur',
                ),
                const SizedBox(height: AppDimensions.gapSmall),
                CustomTextInput(
                  controller: _priceValue,
                  placeholder: 'Saisir montant (H.T./F)',
                ),
                const SizedBox(height: AppDimensions.gapSmall),
                CustomButton(
                  text: 'Valider',
                  textColor: widget.repay
                      ? ColorStyles.greenColor
                      : ColorStyles.redColor,
                  isLoading: _isLoadingValidate,
                  onPressed: () async {
                    setState(() => _isLoadingValidate = true);
                    await FirestoreService.handleAction(
                      context: context,
                      actionType: 'update',
                      documentId: widget.documentId,
                      date: _dateValue.text,
                      number: _numberValue.text,
                      price: _priceValue.text,
                      title: widget.title,
                    );
                    setState(() => _isLoadingValidate = false);
                  },
                ),
                const SizedBox(height: AppDimensions.gapSmall),
                CustomButton(
                  text: 'Supprimer',
                  textColor: widget.repay
                      ? ColorStyles.greenColor
                      : ColorStyles.redColor,
                  isLoading: _isLoadingDelete,
                  onPressed: () async {
                    setState(() => _isLoadingDelete = true);
                    await FirestoreService.handleAction(
                      context: context,
                      actionType: 'delete',
                      documentId: widget.documentId,
                      date: '',
                      number: '',
                      price: '',
                      title: '',
                    );
                    setState(() => _isLoadingDelete = false);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
