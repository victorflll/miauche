import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/base_appbar.dart';
import 'package:miauche/ui/widgets/buttons/app_button.dart';
import 'package:miauche/ui/widgets/fields/app_text_form_field.dart';

class UserRegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

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
              const SizedBox(height: 36),
              const AppText(
                label: "Usuário",
                fontSize: 36,
                isBold: true,
                color: AppColors.darkBlue,
                letterSpacing: 1.5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      AppTextFormField(
                        controller: _emailController,
                        keybordType: TextInputType.emailAddress,
                        label: "Nome:",
                        hintText: "Digite seu nome completo aqui...",
                        prefixIcon: const Icon(
                          Icons.email,
                          color: AppColors.violet,
                        ),
                      ),
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
                      AppTextFormField(
                        controller: _phoneController,
                        keybordType: TextInputType.number,
                        label: "Telefone:",
                        hintText: "Informe seu telefone para contato aqui...",
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: AppColors.violet,
                        ),
                      ),
                      AppButton(
                        text: "Concluir cadastro",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
