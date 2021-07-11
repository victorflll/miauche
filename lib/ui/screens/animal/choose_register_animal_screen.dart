import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';

class ChooseRegisterAnimalScreen extends StatelessWidget {
  const ChooseRegisterAnimalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const AppText(
        label: "Cadastro de Animal",
        isBold: true,
      ),
      content: const AppText(
        label: "Qual opção você deseja cadastrar?",
      ),
      actions: [
        CupertinoDialogAction(
          child: const AppText(
            label: "Encontrado",
            color: AppColors.violet,
          ),
          onPressed: () {
            /*Navigator.pushNamed(
              context,
              "/find-animal-general-register-screen",
            );*/
          },
        ),
        CupertinoDialogAction(
          child: const AppText(
            label: "Perdido",
            color: AppColors.violet,
          ),
          onPressed: () {
            Navigator.pushNamed(
              context,
              "/lost-animal-general-register-screen",
            );
          },
        ),
      ],
    );
  }
}
