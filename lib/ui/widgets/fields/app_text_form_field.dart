import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keybordType;
  final String label;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final int maxLength;

  const AppTextFormField({
    Key? key,
    required this.controller,
    required this.keybordType,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.maxLength = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ??
          (String? text) {
            if (text == null || text.isEmpty) {
              return "Campo obrigatório!";
            } else if (text.length > maxLength) {
              return "Você ultrapassou o limite de caracteres!";
            }

            return null;
          },
      controller: controller,
      keyboardType: keybordType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        fillColor: AppColors.background,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
