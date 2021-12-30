import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';
import 'package:miauche/ui/widgets/buttons/app_button.dart';
import 'package:miauche/ui/widgets/fields/app_dropdown.dart';
import 'package:miauche/ui/widgets/indicator/app_indicator.dart';
import 'package:miauche/ui/widgets/fields/app_text_form_field.dart';

class FindAnimalGeneralRegisterScreen extends StatefulWidget {
  const FindAnimalGeneralRegisterScreen({Key? key}) : super(key: key);

  @override
  State<FindAnimalGeneralRegisterScreen> createState() =>
      _FindAnimalGeneralRegisterScreenState();
}

class _FindAnimalGeneralRegisterScreenState
    extends State<FindAnimalGeneralRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _supostAgeController = TextEditingController();
  final TextEditingController _deficiencyController = TextEditingController();
  final TextEditingController _additionalFeaturesController =
      TextEditingController();

  late String _collar;
  late String _deficiency;
  String? deficiencyYes;
  late String _animal;
  String? animalDog;
  String? animalCat;
  late String _gender;
  late String _dogBreed;
  late String _catBreed;
  late String _sizeAnimal;
  late String _fur;
  late String _furColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BaseAppBar(
              label: "Cadastro de Animal",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            buildIndicator(),
            buildTitle(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Container buildBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppDropdown(
              items: const [
                "Sim",
                "Não",
              ],
              hint: "Possui coleira?",
              callback: _selectCollar,
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _supostAgeController,
              label: "Aparenta ter quantos anos:",
              hintText: "Informe a idade animal aqui...",
            ),
            const SizedBox(height: 16),
            AppDropdown(
              items: const [
                "Sim",
                "Não",
              ],
              hint: "Aparenta ter alguma deficiência?",
              callback: _selectDeficiency,
            ),
            Visibility(
              visible: deficiencyYes == "Sim",
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  AppTextFormField(
                    label: "Deficiência:",
                    hintText:
                        "Informe a deficiência aparente do animal aqui...",
                    controller: _deficiencyController,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            AppDropdown(
              items: const [
                "Cachorro",
                "Gato",
              ],
              hint: "Animal:",
              callback: _selectAnimal,
            ),
            Visibility(
              visible: animalDog == "Cachorro",
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  AppDropdown(
                    items: const [
                      "Vira-lata",
                      "Shih-Tzu",
                      "Yorkshire",
                      "Poodle",
                      "Lhasa Apso",
                      "Buldogue Francês",
                      "Maltês",
                      "Golden Retriever",
                      "Labrador",
                      "Pug",
                      "Dachshund(salsicha)",
                      "Spitz Alemão",
                      "Pinscher",
                      "Schnauzer",
                      "Beagle",
                      "Cocker Spaniel",
                      "Border Collie",
                      "Buldogue Inglês",
                      "Pit Bull",
                      "Chow Chow",
                      "Desconhecida",
                    ],
                    hint: "Raça (Cachorro):",
                    callback: _selectDogBreed,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: animalCat == "Gato",
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  AppDropdown(
                    items: const [
                      "Vira-lata",
                      "Angorá Turco",
                      "Maine Coon",
                      "Persa",
                      "Siamês",
                      "Ragdoll",
                      "Desconhecida"
                    ],
                    hint: "Raça (Gato):",
                    callback: _selectCatBreed,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            AppDropdown(
              items: const [
                "Fêmea",
                "Macho",
              ],
              hint: "Gênero:",
              callback: _selectGender,
            ),
            const SizedBox(height: 16),
            AppDropdown(
              items: const [
                "Pequeno",
                "Médio",
                "Grande",
              ],
              hint: "Porte:",
              callback: _selectSizeAnimal,
            ),
            const SizedBox(height: 16),
            AppDropdown(
              items: const [
                "Curta",
                "Média",
                "Longa",
              ],
              hint: "Pelagem:",
              callback: _selectFur,
            ),
            const SizedBox(height: 16),
            AppDropdown(
              items: const [
                "Branca",
                "Preta",
                "Marrom",
                "Dourada",
                "Cinza",
                "Creme",
              ],
              hint: "Cor da Pelagem:",
              callback: _selectFurColor,
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              isValidated: false,
              maxLines: 6,
              controller: _additionalFeaturesController,
              keybordType: TextInputType.multiline,
              label: "Características adicionais:",
              hintText: "Informe caracteristicas do seu animal aqui...",
            ),
            buildNextButton(),
          ],
        ),
      ),
    );
  }

  Padding buildNextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: AppButton(
        text: "Próximo",
        icon: Icons.arrow_forward,
        onPressed: _onNextStep,
      ),
    );
  }

  Padding buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: AppText(
        label: "Encontrado",
        fontSize: 36,
        color: AppColors.darkBlue,
        isBold: true,
      ),
    );
  }

  Container buildIndicator() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: const AppIndicator(selectedGeneral: true),
    );
  }

  void _selectDeficiency(String deficiency) {
    _deficiency = deficiency;
    setState(() {
      deficiencyYes = deficiency;
    });

    debugPrint(">>>>Deficiency: $_deficiency");
  }

  void _selectAnimal(String animal) {
    _animal = animal;
    setState(() {
      animalDog = animal;
      animalCat = animal;
    });
  }

  void _selectCollar(String collar) {
    _collar = collar;
  }

  void _selectGender(String gender) {
    _gender = gender;
  }

  void _selectDogBreed(String dogBreed) {
    _dogBreed = dogBreed;
  }

  void _selectCatBreed(String catBreed) {
    _catBreed = catBreed;
  }

  void _selectSizeAnimal(String sizeAnimal) {
    _sizeAnimal = sizeAnimal;
  }

  void _selectFur(String fur) {
    _fur = fur;
  }

  void _selectFurColor(String furColor) {
    _furColor = furColor;
  }

  _onNextStep() {
    if (!_formKey.currentState!.validate()) return;

    Map data = {
      'supostAge': _supostAgeController.text,
      'collar': _collar,
      'hasDeficiency': _deficiency,
      'deficiency': _deficiencyController.text,
      'animal': _animal,
      'breed': _animal == 'Cachorro' ? _dogBreed : _catBreed,
      'gender': _gender,
      'sizeAnimal': _sizeAnimal,
      'fur': _fur,
      'furCollor': _furColor,
      'additionalFeatures': _additionalFeaturesController.text,
    };

    Navigator.pushNamed(
      context,
      "/find-animal-adress-register-screen",
      arguments: data,
    );
  }
}
