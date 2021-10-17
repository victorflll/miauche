import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miauche/data/utils/bool_utils.dart';
import 'package:miauche/domain/models/find_animal_model.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';

class DetailsFindListDialog extends StatelessWidget {
  final FindAnimal findAnimal;
  const DetailsFindListDialog({
    Key? key,
    required this.findAnimal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const AppText(
        label: "Mais informações",
        isBold: true,
        color: AppColors.darkBlue,
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppText(
            label: "CARACTERÍSTICAS GERAIS",
            isBold: true,
            align: TextAlign.center,
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Tem coleira? ${convertFromBoolean(findAnimal.hasCollor!)}",
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Idade: ${findAnimal.age}",
          ),
          AppText(
            align: TextAlign.start,
            label:
                "Aparenta ter alguma deficiência? ${convertFromBoolean(findAnimal.hasDeficiency!)}",
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Porte: ${findAnimal.size}",
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Pelagem: ${findAnimal.fur}",
          ),
          const SizedBox(height: 4),
          AppText(
            align: TextAlign.start,
            label: "Cor da pelagem: ${findAnimal.furCollor}",
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Gênero: ${findAnimal.gender}",
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Raça: ${findAnimal.breed}",
          ),
          const SizedBox(height: 4),
          AppText(
            align: TextAlign.start,
            label: "Informações adicionais: ${findAnimal.additionalFeatures}",
          ),
          const SizedBox(height: 8),
          const AppText(
            label: "ENDEREÇO",
            isBold: true,
            align: TextAlign.center,
          ),
          const SizedBox(height: 4),
          AppText(
            align: TextAlign.start,
            label: "Rua: ${findAnimal.street}, Nº: ${findAnimal.houseNumber}",
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Bairro: ${findAnimal.neighborhood}",
          ),
          const SizedBox(height: 4),
          AppText(
            align: TextAlign.start,
            label: "Complemento: ${findAnimal.complement}",
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          child: const AppText(
            label: "OK",
            color: AppColors.violet,
            isBold: true,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
