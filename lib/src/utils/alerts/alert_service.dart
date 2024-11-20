import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';

class AlertDialogWidget extends StatelessWidget {
  final IconData icon;

  const AlertDialogWidget({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Icon(
        icon,
        size: AppDimensions.iconSmall,
      ),
    );
  }

  static void showSuccessDialog(BuildContext context) {
    _showAlert(context, Icons.check_circle);
  }

  static void showErrorDialog(BuildContext context) {
    _showAlert(context, Icons.cancel);
  }

  static void _showAlert(BuildContext context, IconData icon) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialogWidget(
          icon: icon,
        );
      },
    );
  }
}
