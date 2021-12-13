import 'package:flutter/material.dart';
import 'package:miauche/data/utils/string_utils.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';
import 'package:miauche/ui/widgets/buttons/app_button.dart';
import 'package:miauche/ui/widgets/fields/app_text_form_field.dart';
import 'package:miauche/ui/widgets/indicator/app_indicator.dart';
import 'package:search_cep/search_cep.dart';

class FindAnimalAdressRegisterScreen extends StatefulWidget {
  const FindAnimalAdressRegisterScreen({Key? key}) : super(key: key);

  @override
  _FindAnimalAdressRegisterScreenState createState() =>
      _FindAnimalAdressRegisterScreenState();
}

class _FindAnimalAdressRegisterScreenState
    extends State<FindAnimalAdressRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
              label: "Endereço do acolhedor",
              fontSize: 24,
              color: AppColors.darkBlue,
            ),
            const SizedBox(height: 16),
            buildSearchCEP(),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _cityController,
              label: "Cidade:",
              hintText: "Digite sua cidade aqui...",
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _districtController,
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
                    hintText: "Número da residência...",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              maxLines: 3,
              controller: _complementController,
              keybordType: TextInputType.multiline,
              label: "Complemento:",
              hintText: "Digite algum ponto de referência aqui...",
            ),
            buildNextButton(),
          ],
        ),
      ),
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
            filter: {"#": RegExp(r'[0-9]')},
            mask: '#####-###',
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
            onPressed: _onSearch,
          ),
        ),
      ],
    );
  }

  _onSearch() async {
    String cep = removeCEPSymbols(_cepController.text);

    final viaCepSearchCep = ViaCepSearchCep();
    final infoCepJSON = await viaCepSearchCep.searchInfoByCep(cep: cep);

    ViaCepInfo? result = infoCepJSON.fold((_) => null, (data) => data);

    _districtController.text = result!.bairro ?? "";
    _streetController.text = result.logradouro ?? "";
    _cityController.text = result.localidade ?? "";
    _complementController.text = result.complemento ?? "";
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
            "/find-animal-appeal-register-screen",
          ),
        },
      ),
    );
  }
}
