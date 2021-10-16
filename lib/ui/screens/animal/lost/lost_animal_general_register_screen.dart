import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';
import 'package:miauche/ui/widgets/buttons/app_button.dart';
import 'package:miauche/ui/widgets/fields/app_dropdown.dart';
import 'package:miauche/ui/widgets/indicator/app_indicator.dart';
import 'package:miauche/ui/widgets/fields/app_text_form_field.dart';

class LostAnimalGeneralRegisterScreen extends StatefulWidget {
  const LostAnimalGeneralRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LostAnimalGeneralRegisterScreen> createState() =>
      _LostAnimalGeneralRegisterScreenState();
}

class _LostAnimalGeneralRegisterScreenState
    extends State<LostAnimalGeneralRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
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
                Navigator.popAndPushNamed(context, "/home-screen");
              },
            ),
            buildIndicator(),
            buildTitle(),
            buildForm(),
          ],
        ),
      ),
    );
  }

  Container buildForm() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextFormField(
              controller: _nameController,
              keybordType: TextInputType.text,
              label: "Nome:",
              hintText: "Informe o nome do seu animal aqui...",
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _ageController,
              keybordType: TextInputType.text,
              label: "Idade:",
              hintText: "Informe a idade do seu animal aqui...",
            ),
            const SizedBox(height: 16),
            AppDropdown(
              items: const [
                "Sim",
                "Não",
              ],
              hint: "Possui coleira?",
              callback: _selectCollar,
            ),
            const SizedBox(height: 16),
            AppDropdown(
              items: const [
                "Sim",
                "Não",
              ],
              hint: "Possui alguma deficiência?",
              callback: _selectDeficiency,
            ),
            Visibility(
              visible: deficiencyYes == "Sim",
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  AppTextFormField(
                    label: "Deficiência:",
                    hintText: "Informe a deficiência do seu animal aqui...",
                    controller: _deficiencyController,
                    keybordType: TextInputType.text,
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
        onPressed: () => {
          Navigator.pushNamed(
            context,
            "/lost-animal-adress-register-screen",
          ),
        },
      ),
    );
  }

  Padding buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: AppText(
        label: "Perdido",
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

  void _selectCollar(String collar) {
    _collar = collar;

    debugPrint(">>>>Gênero: $_collar");
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

    debugPrint(">>>>Animal: $_animal");
  }

  void _selectGender(String gender) {
    _gender = gender;

    debugPrint(">>>>Gênero: $_gender");
  }

  void _selectDogBreed(String dogBreed) {
    _dogBreed = dogBreed;

    debugPrint(">>>>DogBreed: $_dogBreed");
  }

  void _selectCatBreed(String catBreed) {
    _catBreed = catBreed;

    debugPrint(">>>>CatBreed: $_catBreed");
  }

  void _selectSizeAnimal(String sizeAnimal) {
    _sizeAnimal = sizeAnimal;

    debugPrint(">>>>SizeAnimal: $_sizeAnimal");
  }

  void _selectFur(String fur) {
    _fur = fur;

    debugPrint(">>>>Fur: $_fur");
  }

  void _selectFurColor(String furColor) {
    _furColor = furColor;

    debugPrint(">>>>FurColor: $_furColor");
  }
}
