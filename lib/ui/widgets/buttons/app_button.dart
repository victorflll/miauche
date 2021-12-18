import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';

import '../app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final Color iconColor;
  final Color borderColor;
  final double height;
  final VoidCallback onPressed;
  final IconData? icon;
  final Widget? iconWidget;
  final double fontSize;

  const AppButton({
    Key? key,
    required this.text,
    this.textColor = AppColors.white,
    this.buttonColor = AppColors.darkBlue,
    this.iconColor = AppColors.white,
    this.borderColor = AppColors.darkBlue,
    this.height = 50,
    required this.onPressed,
    this.icon,
    this.iconWidget,
    this.fontSize = 16,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(
            side: BorderSide(
              width: 1,
              color: borderColor,
            ),
          ),
          primary: buttonColor,
          minimumSize: Size(double.maxFinite, height),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              label: text,
              color: textColor,
              fontSize: fontSize,
            ),
            const SizedBox(width: 8),
            iconWidget ?? Icon(icon, color: iconColor),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
