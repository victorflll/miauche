import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/fields/app_text_form_field.dart';

class AppPasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const AppPasswordFormField(
      {Key? key,
      required this.controller,
      required this.obscureText,
      this.validator})
      : super(key: key);

  @override
  State<AppPasswordFormField> createState() => _AppPasswordFormFieldState();
}

class _AppPasswordFormFieldState extends State<AppPasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
      maxLength: 45,
      controller: widget.controller,
      keybordType: TextInputType.visiblePassword,
      label: "Senha",
      hintText: "Insira aqui sua senha...",
      prefixIcon: const Icon(
        Icons.lock_rounded,
        color: AppColors.violet,
      ),
      obscureText: _obscureText,
      suffixIcon: widget.obscureText
          ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: AppColors.violet,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
          : null,
    );
  }
}
