import 'package:flutter/cupertino.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';

class AppIndicator extends StatefulWidget {
  final bool selectedGeneral;
  final bool selectedAdress;
  final bool selectedAppeal;

  const AppIndicator({
    Key? key,
    this.selectedGeneral = false,
    this.selectedAdress = false,
    this.selectedAppeal = false,
  }) : super(key: key);

  @override
  State<AppIndicator> createState() => _AppIndicatorState();
}

class _AppIndicatorState extends State<AppIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: widget.selectedGeneral
                  ? AppColors.darkBlue
                  : AppColors.background,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: AppText(
              label: "GERAL",
              isBold: true,
              color:
                  widget.selectedGeneral ? AppColors.white : AppColors.darkBlue,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: widget.selectedAdress
                  ? AppColors.darkBlue
                  : AppColors.background,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: AppText(
              label: "ENDEREÇO",
              isBold: true,
              color:
                  widget.selectedAdress ? AppColors.white : AppColors.darkBlue,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: widget.selectedAppeal
                  ? AppColors.darkBlue
                  : AppColors.background,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: AppText(
              label: "APELO",
              isBold: true,
              color:
                  widget.selectedAppeal ? AppColors.white : AppColors.darkBlue,
            ),
          ),
        ),
      ],
    );
  }
}
