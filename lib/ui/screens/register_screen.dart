import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Miauche"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 40)),
                const Text("Cadastro Usuário",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "poppins",
                        fontWeight: FontWeight.bold)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: Form(
                      child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 25),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Nome: ",
                            hintText: "Digite seu nome completo"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "E-mail: ",
                            hintText: "Digite um e-mail válido"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Senha:", hintText: "Digite uma senha"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Confirmação de senha:",
                            hintText: "Repita a senha"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Telefone:",
                            hintText: "Informe um telefone para contato"),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 35),
                          width: double.maxFinite,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.darkBlue),
                            ),
                            child: Text("Cadastrar"),
                            onPressed: () {},
                          )),
                    ],
                  )),
                ),
              ],
            )),
      ),
    );
  }
}
