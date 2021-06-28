import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';

import '../app_text.dart';

class AppCompleteButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final double height;
  final VoidCallback onPressed;

  const AppCompleteButton({
    Key? key,
    required this.text,
    this.textColor = AppColors.white,
    this.buttonColor = AppColors.darkBlue,
    this.height = 50,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: buttonColor,
          minimumSize: Size(double.maxFinite, height),
        ),
        child: AppText(
          label: text,
          color: textColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
