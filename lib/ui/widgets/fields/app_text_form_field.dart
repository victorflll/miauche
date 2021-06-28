import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keybordType;
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final IconData? sufixIcon;
  final bool obscureText;

  const AppTextFormField({
    Key? key,
    required this.controller,
    required this.keybordType,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    required this.obscureText,
    this.sufixIcon,
  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //validator: ,
      controller: widget.controller,
      keyboardType: widget.keybordType,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        filled: true,
        fillColor: AppColors.background,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: AppColors.blue,
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.blue,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
