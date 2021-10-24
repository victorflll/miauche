import 'package:flutter/material.dart';
import 'package:miauche/data/utils/string_utils.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';
import 'package:miauche/ui/widgets/buttons/app_button.dart';
import 'package:miauche/ui/widgets/fields/app_text_form_field.dart';
import 'package:search_cep/search_cep.dart';

class UserRegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordAgainController = TextEditingController();
  final _nameController = TextEditingController();
  final _cepController = TextEditingController();
  final _districtController = TextEditingController();
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _cityController = TextEditingController();
  final _complementController = TextEditingController();

  UserRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const BaseAppBar(label: "Cadastro"),
              buildTitle(),
              buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildForm() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextFormField(
              controller: _nameController,
              keybordType: TextInputType.name,
              label: "Nome Completo:",
              hintText: "Digite seu nome aqui...",
              prefixIcon: const Icon(
                Icons.person,
                color: AppColors.violet,
              ),
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _emailController,
              keybordType: TextInputType.emailAddress,
              label: "Email:",
              hintText: "Digite seu email aqui...",
              prefixIcon: const Icon(
                Icons.email,
                color: AppColors.violet,
              ),
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _passwordController,
              keybordType: TextInputType.visiblePassword,
              label: "Senha:",
              hintText: "Digite uma senha aqui...",
              prefixIcon: const Icon(
                Icons.lock_rounded,
                color: AppColors.violet,
              ),
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _passwordAgainController,
              keybordType: TextInputType.visiblePassword,
              label: "Confirmação de senha:",
              hintText: "Repita a senha aqui...",
              prefixIcon: const Icon(
                Icons.lock_rounded,
                color: AppColors.violet,
              ),
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _phoneController,
              keybordType: TextInputType.number,
              label: "Telefone:",
              hintText: "Informe seu telefone para contato aqui...",
              prefixIcon: const Icon(
                Icons.phone,
                color: AppColors.violet,
              ),
              filter: {"#": RegExp(r'[0-9]')},
              mask: '(##) #####-####',
            ),
            const SizedBox(height: 16),
            buildSearchCEP(),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _cityController,
              keybordType: TextInputType.text,
              label: "Cidade:",
              hintText: "Digite sua cidade aqui...",
              prefixIcon: const Icon(
                Icons.location_city,
                color: AppColors.violet,
              ),
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _districtController,
              keybordType: TextInputType.text,
              label: "Bairro:",
              hintText: "Digite seu bairro aqui...",
              prefixIcon: const Icon(
                Icons.edit_road_outlined,
                color: AppColors.violet,
              ),
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
                    prefixIcon: const Icon(
                      Icons.confirmation_number_outlined,
                      color: AppColors.violet,
                    ),
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
              controller: _complementController,
              keybordType: TextInputType.multiline,
              label: "Complemento:",
              hintText: "Digite algum ponto de referência aqui...",
              prefixIcon: const Icon(
                Icons.add,
                color: AppColors.violet,
              ),
            ),
            const SizedBox(height: 16),
            AppButton(
              text: "Concluir cadastro",
              icon: Icons.done,
              onPressed: _onRegister,
            ),
            const SizedBox(height: 24),
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
            prefixIcon: const Icon(
              Icons.location_on,
              color: AppColors.violet,
            ),
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

  Padding buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: AppText(
        label: "Usuário",
        fontSize: 36,
        color: AppColors.darkBlue,
        isBold: true,
      ),
    );
  }

  _onRegister() {
    if (!_formKey.currentState!.validate()) return;
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
}
