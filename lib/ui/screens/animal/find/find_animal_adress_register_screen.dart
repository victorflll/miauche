import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';
import 'package:miauche/ui/widgets/indicator/app_indicator.dart';

class FindAnimalAdressRegisterScreen extends StatefulWidget {
  const FindAnimalAdressRegisterScreen({Key? key}) : super(key: key);

  @override
  _FindAnimalAdressRegisterScreenState createState() =>
      _FindAnimalAdressRegisterScreenState();
}

class _FindAnimalAdressRegisterScreenState
    extends State<FindAnimalAdressRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BaseAppBar(label: "Cadastro de Animal"),
            buildIndicator(),
            buildTitle(),
            buildBody(),
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

  Container buildBody() {
    return Container();
  }

  /*Padding buildNextButton() {
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
  }*/
}
