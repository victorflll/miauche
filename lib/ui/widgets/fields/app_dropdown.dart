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
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: visible,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 6),
              child: AppText(
                label: widget.hint,
                fontSize: 13,
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                hoverColor: AppColors.darkBlue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                hintStyle: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
              isExpanded: true,
              dropdownColor: AppColors.background,
              iconEnabledColor: AppColors.darkBlue,
              iconSize: 32,
              value: dropdownItem,
              hint: AppText(
                label: widget.hint,
                fontSize: 14,
              ),
              items: widget.items.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: AppText(
                    label: item,
                    color: Colors.grey.shade800,
                  ),
                );
              }).toList(),
              onChanged: (String? newItem) {
                setState(() {
                  dropdownItem = newItem!;
                  widget.callback(dropdownItem);
                  if (visible) {
                    visible = false;
                  } else {
                    visible = true;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
