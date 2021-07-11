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
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontFamily: "Poppins",
      ),
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          fontSize: 16,
          fontFamily: "Poppins",
          color: Colors.black,
        ),
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontFamily: "Poppins",
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        labelText: label,
        fillColor: AppColors.background,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
