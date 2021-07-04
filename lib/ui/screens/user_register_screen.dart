import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';

class UserRegisterScreen extends StatelessWidget {
  const UserRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          label: "Miauche",
          color: (AppColors.white),
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
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(height: 36),
                const AppText(
                  label: "Cadastro de Usuário",
                  fontSize: 24,
                  fontFamily: "Poppins",
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Form(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Nome: ",
                            hintText: "Digite seu nome completo aqui...",
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "E-mail: ",
                            hintText: "Digite seu e-mail aqui...",
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Senha:",
                            hintText: "Digite uma senha aqui...",
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Confirmação de senha:",
                            hintText: "Repita a senha aqui...",
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Telefone:",
                            hintText:
                                "Informe seu telefone para contato aqui...",
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 32),
                          width: double.maxFinite,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.darkBlue),
                            ),
                            child: const AppText(
                              label: "Cadastrar",
                              color: (AppColors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
