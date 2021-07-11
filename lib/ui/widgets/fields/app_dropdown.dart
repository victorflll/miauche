import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';

class AppDropdown extends StatefulWidget {
  final List<String> items;
  final String hint;
  final dynamic callback;

  const AppDropdown({
    Key? key,
    required this.items,
    required this.hint,
    required this.callback,
  }) : super(key: key);

  @override
  _AppDropdownState createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  String? dropdownItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: "Poppins",
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
          isExpanded: true,
          dropdownColor: AppColors.white,
          iconEnabledColor: AppColors.blue,
          value: dropdownItem,
          hint: AppText(
            label: widget.hint,
          ),
          items: widget.items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: AppText(
                label: item,
              ),
            );
          }).toList(),
          onChanged: (String? newItem) {
            setState(() {
              dropdownItem = newItem!;
              widget.callback(dropdownItem);
            });
          },
        ),
      ),
    );
  }
}
