import 'package:flutter/material.dart';
import 'package:miauche/ui/screens/user_register_screen.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/buttons/app_complete_button.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
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
          child: buildBody(),
        ),
      ),
    );
  }

  buildBody() {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: buildLogo(),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 32),
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
                buildForm(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: Image.asset(
            "assets/images/dog.png",
            fit: BoxFit.scaleDown,
            width: 160,
          ),
        ),
        Image.asset(
          "assets/images/gato.png",
          fit: BoxFit.scaleDown,
          width: 160,
        ),
      ],
    );
  }

  buildForm() {
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
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 12),
            AppTextFormField(
              obscureText: true,
              controller: _passwordController,
              keybordType: TextInputType.visiblePassword,
              label: "Senha",
              hintText: "Insira sua senha aqui...",
              prefixIcon: Icons.lock_rounded,
            ),
            AppCompleteButton(
              text: "Entrar",
              onPressed: () => {},
            ),
            buildFooter(),
          ],
        ),
      ),
    );
  }

  buildFooter() {
    return Column(
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
        Row(
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
      ],
    );
  }
}
