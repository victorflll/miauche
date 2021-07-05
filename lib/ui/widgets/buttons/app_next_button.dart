import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import '../app_text.dart';

class AppNextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onPressed;

  const AppNextButton({
    Key? key,
    this.text = "Próxima",
    this.textColor = AppColors.white,
    this.buttonColor = AppColors.darkBlue,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      width: double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            buttonColor,
          ),
        ),
        child: AppText(
          label: text,
          isBold: true,
          color: textColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
