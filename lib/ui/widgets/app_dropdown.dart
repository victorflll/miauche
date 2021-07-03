import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';

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
      padding: const EdgeInsets.only(left: 12),
      margin: const EdgeInsets.all(6),
      color: AppColors.background,
      child: DropdownButton(
        isExpanded: true,
        dropdownColor: AppColors.white,
        iconEnabledColor: AppColors.darkBlue,
        value: dropdownItem,
        hint: Text(widget.hint),
        items: widget.items.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newItem) {
          setState(() {
            dropdownItem = newItem!;
            widget.callback(dropdownItem);
          });
        },
      ),
    );
  }
}
