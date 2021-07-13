import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';
import 'package:miauche/ui/widgets/buttons/app_button.dart';
import 'package:miauche/ui/widgets/fields/app_text_form_field.dart';
import 'package:miauche/ui/widgets/indicator/app_indicator.dart';

class LostAnimalAdressRegisterScreen extends StatefulWidget {
  const LostAnimalAdressRegisterScreen({Key? key}) : super(key: key);

  @override
  _LostAnimalAdressRegisterScreenState createState() =>
      _LostAnimalAdressRegisterScreenState();
}

class _LostAnimalAdressRegisterScreenState
    extends State<LostAnimalAdressRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();
  late bool inHome;
  final TextEditingController _districtTrueController = TextEditingController();
  final TextEditingController _streetTrueController = TextEditingController();
  final TextEditingController _cityTrueController = TextEditingController();
  final TextEditingController _complementTrueController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    inHome = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BaseAppBar(label: "Cadastro de Animal"),
            buildIndicator(),
            buildTitle(),
            buildForm(),
          ],
        ),
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
      child: const AppIndicator(selectedAdress: true),
    );
  }

  Container buildForm() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const AppText(
              label: "Endereço do dono",
              fontSize: 24,
              color: AppColors.darkBlue,
            ),
            const SizedBox(height: 16),
            buildSearchCEP(),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _cityController,
              keybordType: TextInputType.text,
              label: "Cidade:",
              hintText: "Digite sua cidade aqui...",
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _districtController,
              keybordType: TextInputType.text,
              label: "Bairro:",
              hintText: "Digite seu bairro aqui...",
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AppTextFormField(
                    controller: _streetController,
                    keybordType: TextInputType.text,
                    label: "Rua:",
                    hintText: "Digite sua rua aqui...",
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: AppTextFormField(
                    controller: _numberController,
                    keybordType: TextInputType.number,
                    label: "Nº:",
                    hintText: "Digite o número da sua casa aqui...",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _complementController,
              keybordType: TextInputType.multiline,
              label: "Complemento:",
              hintText: "Digite algum ponto de referência aqui...",
            ),
            const SizedBox(height: 32),
            buildSwitch(),
            buildVisibility(),
            buildNextButton(),
          ],
        ),
      ),
    );
  }

  Visibility buildVisibility() {
    return Visibility(
      visible: inHome,
      child: Column(
        children: [
          const SizedBox(height: 32),
          const AppText(
            label: "Endereço do último avistamento",
            fontSize: 24,
            color: AppColors.darkBlue,
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            controller: _cityTrueController,
            keybordType: TextInputType.text,
            label: "Cidade:",
            hintText: "Digite sua cidade aqui...",
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            controller: _districtTrueController,
            keybordType: TextInputType.text,
            label: "Bairro:",
            hintText: "Digite seu bairro aqui...",
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            controller: _streetTrueController,
            keybordType: TextInputType.text,
            label: "Rua:",
            hintText: "Digite sua rua aqui...",
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            controller: _complementTrueController,
            keybordType: TextInputType.multiline,
            label: "Complemento:",
            hintText: "Digite algum ponto de referência aqui...",
          ),
        ],
      ),
    );
  }

  Row buildSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppText(
          label: "O animal se perdeu em\n um lugar diferente?",
        ),
        const SizedBox(width: 24),
        CupertinoSwitch(
          activeColor: AppColors.darkBlue,
          value: inHome,
          onChanged: (bool active) {
            setState(() {
              inHome = active;
            });
          },
        ),
      ],
    );
  }

  Row buildSearchCEP() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: AppTextFormField(
            controller: _cepController,
            keybordType: TextInputType.number,
            label: "CEP",
            hintText: "Digite seu CEP aqui...",
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              primary: AppColors.darkBlue,
            ),
            child: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
      ],
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
            "/lost-animal-appeal-register-screen",
          ),
        },
      ),
    );
  }
}
