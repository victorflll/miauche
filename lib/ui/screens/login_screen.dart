import 'package:flutter/material.dart';
import 'package:miauche/data/dao/user_dao.dart';
import 'package:miauche/domain/models/user_model.dart';
import 'package:miauche/ui/screens/home_screen.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/buttons/app_button.dart';
import 'package:miauche/ui/widgets/dialog/app_alert_dialog.dart';
import 'package:miauche/ui/widgets/fields/app_password_form_field.dart';
import 'package:miauche/ui/widgets/line.dart';
import 'package:miauche/ui/widgets/buttons/app_rounded_icon_button.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/fields/app_text_form_field.dart';
import 'dart:math' as math;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: height,
            maxWidth: width,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.darkBlue,
                AppColors.background,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            ),
          ),
          child: buildBody(height: height, width: width),
        ),
      ),
    );
  }

  buildBody({required width, required height}) {
    return Column(
      children: [
        buildLogo(height: height, width: width),
        Container(
          height: height * .70,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 24),
                child: AppText(
                  label: "Miauche",
                  isBold: true,
                  letterSpacing: 3,
                  fontSize: 36,
                  color: AppColors.darkBlue,
                ),
              ),
              const AppText(
                label: "Olá! Seja bem-vindo.",
                color: AppColors.darkBlue,
              ),
              buildForm(height: height, width: width),
            ],
          ),
        ),
      ],
    );
  }

  buildLogo({required width, required height}) {
    return SizedBox(
      width: double.maxFinite,
      height: height * .30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Image.asset(
              "assets/images/dog.png",
              fit: BoxFit.scaleDown,
              width: width * .38,
            ),
          ),
          Image.asset(
            "assets/images/gato.png",
            fit: BoxFit.scaleDown,
            width: width * .42,
          ),
        ],
      ),
    );
  }

  buildForm({required width, required height}) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextFormField(
              obscureText: false,
              controller: _emailController,
              keybordType: TextInputType.emailAddress,
              label: "E-mail",
              hintText: "Insira seu email aqui...",
              prefixIcon: const Icon(
                Icons.email,
                color: AppColors.violet,
              ),
            ),
            const SizedBox(height: 12),
            AppPasswordFormField(
              controller: _passwordController,
              obscureText: true,
            ),
            buildForgetPasswordButton(height: height, width: width),
            buildLoginButton(height: height, width: width),
            buildFooter(height: height, width: width),
          ],
        ),
      ),
    );
  }

  AppButton buildLoginButton({required width, required height}) {
    return AppButton(
      text: "Entrar",
      icon: Icons.login,
      onPressed: _onLogin,
    );
  }

  Container buildForgetPasswordButton({required width, required height}) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: const AppText(
          label: "Esqueceu a senha?",
          color: AppColors.darkBlue,
          fontSize: 14,
          isBold: true,
        ),
      ),
    );
  }

  buildFooter({required width, required height}) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                flex: 1,
                child: Line(),
              ),
              Expanded(
                flex: 1,
                child: AppText(
                  label: "ou Entre com",
                  color: AppColors.darkBlue,
                ),
              ),
              Expanded(
                flex: 1,
                child: Line(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppRoundedIconButton(
                  imagePath: "assets/images/facebook.png",
                  onTap: () {},
                ),
                AppRoundedIconButton(
                  imagePath: "assets/images/google.png",
                  onTap: () {},
                ),
                AppRoundedIconButton(
                  imagePath: "assets/images/apple.png",
                  onTap: () {},
                ),
              ],
            ),
          ),
          buildRegisterButton(height: height, width: width),
        ],
      ),
    );
  }

  buildRegisterButton({required width, required height}) {
    return SizedBox(
      height: height * .05,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppText(
            label: "Não tem conta ainda?",
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/user-register-screen");
            },
            child: const AppText(
              label: "Cadastre-se",
              color: AppColors.darkBlue,
              isBold: true,
            ),
          ),
        ],
      ),
    );
  }

  _onLogin() async {
    if (!_formKey.currentState!.validate()) return;

    String email = _emailController.text;
    String password = _passwordController.text;

    final data = await UserDAO().fetchUserByEmailAndPassword(
      email: email,
      password: password,
    );

    if (data.isNotEmpty) {
      Navigator.pushNamed(context, "/home-screen", arguments: data[0]);
    } else {
      showDialog(
        context: context,
        builder: (_) => const AppAlertDialog(
          icon: Icons.highlight_remove_outlined,
          text: "Usuário ou Senha inválidos!",
          description:
              "Verifique se digitou tudo certo ou então tente se cadastrar.",
        ),
      );
    }
  }
}
