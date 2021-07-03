import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_dropdown.dart';
import 'package:miauche/ui/widgets/app_text.dart';

class RegisterLostScreen extends StatefulWidget {
  const RegisterLostScreen({Key? key}) : super(key: key);

  @override
  State<RegisterLostScreen> createState() => _RegisterLostScreenState();
}

class _RegisterLostScreenState extends State<RegisterLostScreen> {
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
        title: const Text("Miauche"),
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
            color: AppColors.blue,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const AppText(
                  label: "Animal Perdido",
                  fontSize: 36,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Form(
                      child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Nome:",
                                fillColor: AppColors.background,
                                filled: true,
                                hintText:
                                    "Informe o nome do seu animal aqui...")),
                      ),
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: "Idade:",
                                fillColor: AppColors.background,
                                filled: true,
                                hintText:
                                    "Informe a idade do seu animal aqui...")),
                      ),
                      AppDropdown(
                        items: const ["Sim", "Não"],
                        hint: "Possui alguma deficiência?",
                        callback: _selectDeficiency,
                      ),
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Deficiência:",
                                fillColor: AppColors.background,
                                filled: true,
                                hintText:
                                    "Informe a deficiência do seu animal aqui...")),
                      ),
                      AppDropdown(
                        items: const ["Cachorro", "Gato"],
                        hint: "Animal:",
                        callback: _selectAnimal,
                      ),
                      AppDropdown(
                        items: const ["Fêmea", "Macho"],
                        hint: "Gênero:",
                        callback: _selectGender,
                      ),
                      AppDropdown(
                        items: const [
                          "Vira-lata",
                          "Angorá Turco",
                          "Maine Coon",
                          "Persa",
                          "Siamês",
                          "Ragdoll"
                        ],
                        hint: "Raça (Gato):",
                        callback: _selectcatBreed,
                      ),
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
                          "Chow Chow"
                        ],
                        hint: "Raça (Cachorro):",
                        callback: _selectdogBreed,
                      ),
                      AppDropdown(
                        items: const ["Pequeno", "Médio", "Grande"],
                        hint: "Porte:",
                        callback: _selectsizeAnimal,
                      ),
                      AppDropdown(
                        items: const ["Curta", "Média", "Longa"],
                        hint: "Pelagem:",
                        callback: _selectfur,
                      ),
                      AppDropdown(
                        items: const [
                          "Branca",
                          "Preta",
                          "Marrom",
                          "Dourada",
                          "Cinza",
                          "Creme"
                        ],
                        hint: "Cor da Pelagem:",
                        callback: _selectfurColor,
                      ),
                      Container(
                          margin: const EdgeInsets.all(6),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Características adicionais:",
                              fillColor: AppColors.background,
                              filled: true,
                              hintText:
                                  "Informe caracteristicas do seu animal aqui...",
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        width: double.maxFinite,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.darkBlue,
                            ),
                          ),
                          child: const Text("Próximo"),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )),
                )
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

  void _selectdogBreed(String dogBreed) {
    _dogBreed = dogBreed;

    debugPrint(">>>>DogBreed: $_dogBreed");
  }

  void _selectcatBreed(String catBreed) {
    _catBreed = catBreed;

    debugPrint(">>>>CatBreed: $_catBreed");
  }

  void _selectsizeAnimal(String sizeAnimal) {
    _sizeAnimal = sizeAnimal;

    debugPrint(">>>>SizeAnimal: $_sizeAnimal");
  }

  void _selectfur(String fur) {
    _fur = fur;

    debugPrint(">>>>Fur: $_fur");
  }

  void _selectfurColor(String furColor) {
    _furColor = furColor;

    debugPrint(">>>>FurColor: $_furColor");
  }
}
