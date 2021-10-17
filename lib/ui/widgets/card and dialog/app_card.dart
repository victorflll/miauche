import 'package:flutter/material.dart';
import 'package:miauche/domain/models/find_animal_model.dart';
import 'package:miauche/domain/models/lost_animal_model.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/buttons/app_button.dart';
import 'package:miauche/ui/widgets/card%20and%20dialog/details_list_find_dialog.dart';
import 'package:miauche/ui/widgets/card%20and%20dialog/details_list_lost_dialog.dart';

import '../app_text.dart';

class AppCard extends StatefulWidget {
  final String animalType;
  final String description;
  final String phoneContact;
  final String imagePath;
  final bool isFind;
  final FindAnimal? findAnimal;
  final LostAnimal? lostAnimal;
  const AppCard({
    Key? key,
    required this.animalType,
    required this.description,
    required this.phoneContact,
    required this.imagePath,
    this.isFind = false,
    this.findAnimal,
    this.lostAnimal,
  }) : super(key: key);

  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      elevation: 2,
      child: Column(
        children: [
          buildCardImage(imagePath: widget.imagePath),
          buildNewsTitle(animalType: widget.animalType),
          buildDescription(description: widget.description),
          buildPhoneContact(phoneContact: widget.phoneContact),
          buildInformationButton(),
        ],
      ),
    );
  }

  Container buildInformationButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: AppButton(
        text: "Mais informações",
        buttonColor: AppColors.blue,
        onPressed: () {
          if (widget.isFind) {
            showDialog(
              context: context,
              builder: (_) => DetailsFindListDialog(
                findAnimal: widget.findAnimal!,
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (_) => DetailsLostListDialog(
                lostAnimal: widget.lostAnimal!,
              ),
            );
          }
        },
        icon: Icons.info_outline,
      ),
    );
  }

  Padding buildPhoneContact({required String phoneContact}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: AppText(label: "Telefone para contato: $phoneContact"),
    );
  }

  Padding buildDescription({required String description}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppText(
          color: Colors.grey.shade700,
          label: widget.isFind
              ? "Animal encontrado nas redondezas do $description."
              : "Animal perdido nas redondezas do $description."),
    );
  }

  Padding buildNewsTitle({required String animalType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppText(
        label: widget.isFind
            ? "Dê um lar este $animalType!"
            : "Ajude a encontrar este $animalType!",
        fontSize: 24,
        isBold: true,
        color: AppColors.violet,
      ),
    );
  }

  Container buildCardImage({required String imagePath}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, top: 24),
      padding: const EdgeInsets.all(12),
      width: 200,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.darkBlue, width: 2),
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.fitHeight,
          ),
          shape: BoxShape.circle,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkBlue, width: 2),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
