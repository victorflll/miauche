import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miauche/ui/widgets/app_text.dart';

class AppAlertDialog extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String? text;
  final Color? textColor;
  final String? description;
  final String? buttonText;
  final Color? buttonColor;
  final Function()? onPressed;

  const AppAlertDialog({
    Key? key,
    this.text,
    this.icon,
    this.iconColor,
    this.textColor,
    this.description,
    this.buttonText,
    this.buttonColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(
        icon ?? Icons.error,
        color: iconColor ?? Colors.red.shade900,
        size: 36,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            label: text ?? "Ocorreu um erro!",
            isBold: true,
            color: Colors.red.shade900,
            fontSize: 20,
          ),
          const SizedBox(height: 8),
          AppText(
            label: description ??
                "Aconteceu um problema inesperado. Por favor, tente novamente mais tarde!",
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          child: AppText(
            label: buttonText ?? "Entendido!",
            color: buttonColor ?? Colors.red.shade900,
            isBold: true,
          ),
          onPressed: onPressed ??
              () {
                Navigator.pop(context);
              },
        ),
      ],
    );
  }
}
