import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/buttons/app_next_button.dart';
import 'package:miauche/ui/widgets/fields/app_dropdown.dart';

class LostAnimalGeneralRegisterScreen extends StatefulWidget {
  const LostAnimalGeneralRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LostAnimalGeneralRegisterScreen> createState() =>
      _LostAnimalGeneralRegisterScreenState();
}

class _LostAnimalGeneralRegisterScreenState
    extends State<LostAnimalGeneralRegisterScreen> {
  late String _deficiency;
  late String _animal;
  late String _gender;
  late String _dogBreed;
  late String _catBreed;
  late String _sizeAnimal;
  late String _fur;
  late String _furColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          label: "Miauche",
          isBold: true,
          color: AppColors.white,
          fontSize: 20,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 32),
                  child: const AppText(
                    label: "Animal Perdido",
                    fontSize: 36,
                    color: AppColors.darkBlue,
                    isBold: true,
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white),
                          ),
                          labelText: "Nome:",
                          fillColor: AppColors.white,
                          filled: true,
                          hintText: "Informe o nome do seu animal aqui...",
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white),
                          ),
                          labelText: "Idade:",
                          fillColor: AppColors.white,
                          filled: true,
                          hintText: "Informe a idade do seu animal aqui...",
                        ),
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
                      const SizedBox(height: 16),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white),
                          ),
                          labelText: "Deficiência:",
                          fillColor: AppColors.white,
                          filled: true,
                          hintText:
                              "Informe a deficiência do seu animal aqui...",
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
                      const SizedBox(height: 16),
                      AppDropdown(
                        items: const [
                          "Fêmea",
                          "Macho",
                        ],
                        hint: "Gênero:",
                        callback: _selectGender,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppDropdown(
                        items: const [
                          "Vira-lata",
                          "Angorá Turco",
                          "Maine Coon",
                          "Persa",
                          "Siamês",
                          "Ragdoll",
                        ],
                        hint: "Raça (Gato):",
                        callback: _selectCatBreed,
                      ),
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
                        ],
                        hint: "Raça (Cachorro):",
                        callback: _selectDogBreed,
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
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white),
                          ),
                          labelText: "Características adicionais:",
                          fillColor: AppColors.white,
                          filled: true,
                          hintText:
                              "Informe caracteristicas do seu animal aqui...",
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppNextButton(
                        onPressed: () => {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectDeficiency(String deficiency) {
    _deficiency = deficiency;

    debugPrint(">>>>Deficiency: $_deficiency");
  }

  void _selectAnimal(String animal) {
    _animal = animal;

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
