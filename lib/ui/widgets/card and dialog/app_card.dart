import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/buttons/app_button.dart';

import '../app_text.dart';

class AppCard extends StatefulWidget {
  final String animalName;
  final String description;
  final String phoneContact;
  final String imagePath;
  const AppCard({
    Key? key,
    required this.animalName,
    required this.description,
    required this.phoneContact,
    required this.imagePath,
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
          buildNewsTitle(animalName: widget.animalName),
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
        onPressed: () {},
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
          label: "Animal encontrado nas redondezas do $description."),
    );
  }

  Padding buildNewsTitle({required String animalName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppText(
        label: "Dê um lar para o $animalName!",
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
