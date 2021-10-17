import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miauche/data/utils/bool_utils.dart';
import 'package:miauche/domain/models/lost_animal_model.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';

class DetailsLostListDialog extends StatelessWidget {
  final LostAnimal lostAnimal;
  const DetailsLostListDialog({
    Key? key,
    required this.lostAnimal,
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
            label: "Nome: ${lostAnimal.name}",
          ),
          const SizedBox(height: 4),
          AppText(
            label:
                "Tinha coleira? ${convertFromBoolean(lostAnimal.hasCollor!)}",
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Idade: ${lostAnimal.age}",
          ),
          AppText(
            align: TextAlign.start,
            label:
                "Tem alguma deficiência? ${convertFromBoolean(lostAnimal.hasDeficiency!)}",
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Porte: ${lostAnimal.size}",
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Pelagem: ${lostAnimal.fur}",
          ),
          const SizedBox(height: 4),
          AppText(
            align: TextAlign.start,
            label: "Cor da pelagem: ${lostAnimal.furCollor}",
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Gênero: ${lostAnimal.gender}",
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Raça: ${lostAnimal.breed}",
          ),
          const SizedBox(height: 4),
          AppText(
            align: TextAlign.start,
            label: "Informações adicionais: ${lostAnimal.additionalFeatures}",
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
            label: "Rua: ${lostAnimal.street}, Nº: ${lostAnimal.houseNumber}",
          ),
          const SizedBox(height: 4),
          AppText(
            label: "Bairro: ${lostAnimal.neighborhood}",
          ),
          const SizedBox(height: 4),
          AppText(
            align: TextAlign.start,
            label: "Complemento: ${lostAnimal.complement}",
          ),
          const SizedBox(height: 4),
          const AppText(
            label: "ADICIONAIS",
            isBold: true,
            align: TextAlign.center,
          ),
          const SizedBox(height: 4),
          AppText(
            align: TextAlign.start,
            label: "Recompensa: ${lostAnimal.reward}",
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
