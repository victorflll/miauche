import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';
import 'package:miauche/ui/widgets/buttons/app_button.dart';
import 'package:miauche/ui/widgets/fields/app_text_form_field.dart';

class ListLostAnimalsScreen extends StatefulWidget {
  const ListLostAnimalsScreen({Key? key}) : super(key: key);

  @override
  _ListLostAnimalsScreenState createState() => _ListLostAnimalsScreenState();
}

class _ListLostAnimalsScreenState extends State<ListLostAnimalsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _filter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BaseAppBar(label: "Listagem"),
            buildTitle(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          const AppText(
            label: "Animais Perdidos",
            fontSize: 32,
            color: AppColors.darkBlue,
            isBold: true,
          ),
          buildFilterButton(),
        ],
      ),
    );
  }

  Padding buildFilterButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: AppTextFormField(
          controller: _filter,
          keybordType: TextInputType.text,
          label: "Filtrar:",
          hintText: "Filtro de pesquisa",
          suffixIcon: InkWell(
            child: const Icon(Icons.search),
            onTap: () {},
          ),
        ),
      ),
    );
  }

  buildBody() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        primary: true,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return buildCard(
            animalName: "Pedrinho",
            description: "Bosque das Arapiracas",
            phoneContact: "(82) 98181-9981",
            imagePath:
                'https://inovaveterinaria.com.br/wp-content/uploads/2021/02/INOVA-Verme-em-cachorro-GS2-Marketing-Digital-1024x684.jpg',
          );
        },
      ),
    );
  }

  Card buildCard({
    required String animalName,
    required String description,
    required String phoneContact,
    required String imagePath,
  }) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      elevation: 2,
      child: Column(
        children: [
          buildCardImage(imagePath: imagePath),
          buildNewsTitle(animalName: animalName),
          buildDescription(description: description),
          buildPhoneContact(phoneContact: phoneContact),
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
          label: "Animal perdido nas redondezas do $description."),
    );
  }

  Padding buildNewsTitle({required String animalName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppText(
        label: "Ajude a encontrar o $animalName!",
        fontSize: 24,
        isBold: true,
        color: AppColors.violet,
      ),
    );
  }

  Container buildCardImage({required String imagePath}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, top: 24),
      padding: const EdgeInsets.symmetric(vertical: 64),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red.shade900, width: 4),
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.fitHeight,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
