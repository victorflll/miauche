import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:miauche/ui/styles/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keybordType;
  final String label;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final String? mask;
  final Map<String, RegExp>? filter;
  final AutovalidateMode? autovalidateMode;
  final int? minLines;
  final int? maxLines;

  const AppTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.keybordType = TextInputType.text,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.mask,
    this.filter,
    this.autovalidateMode,
    this.minLines,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      validator: validator ??
          (String? text) {
            if (text == null || text.isEmpty) {
              return "O e-mail é obrigatório!";
            }
            if(!text.contains('@')){
              return 'E-mail inválido';
            }
            return null;
          },
      controller: controller,
      keyboardType: keybordType,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey.shade800,
        fontFamily: "Poppins",
      ),
      minLines: minLines,
      maxLines: maxLines,
      inputFormatters: [
        MaskTextInputFormatter(
          mask: mask,
          filter: filter,
        ),
      ],
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        labelStyle: const TextStyle(
          height: 1,
          fontSize: 14,
          fontFamily: "Poppins",
          color: Colors.black,
        ),
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontFamily: "Poppins",
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        labelText: label,
        fillColor: AppColors.background,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
