import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.maxFinite,
      color: Colors.grey,
    );
  }
}
