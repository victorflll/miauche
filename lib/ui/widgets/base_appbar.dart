import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';

import 'app_text.dart';

class BaseAppBar extends StatelessWidget {
  final String label;
  final IconData? icon;

  const BaseAppBar({
    Key? key,
    required this.label,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText(
        label: label,
        isBold: true,
        color: AppColors.white,
        fontSize: 20,
      ),
      leading: IconButton(
        icon: Icon(icon ?? Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
