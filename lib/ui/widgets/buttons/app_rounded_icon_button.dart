import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoundedIconButton extends StatelessWidget {
  final String imagePath;
  final GestureTapCallback onTap;

  const AppRoundedIconButton({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
