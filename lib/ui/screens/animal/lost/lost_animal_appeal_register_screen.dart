import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';
import 'package:miauche/ui/widgets/indicator/app_indicator.dart';

class LostAnimalAppealRegisterScreen extends StatefulWidget {
  const LostAnimalAppealRegisterScreen({Key? key}) : super(key: key);

  @override
  _LostAnimalAppealRegisterScreenState createState() =>
      _LostAnimalAppealRegisterScreenState();
}

class _LostAnimalAppealRegisterScreenState
    extends State<LostAnimalAppealRegisterScreen> {
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
      child: const AppIndicator(selectedAppeal: true),
    );
  }

  Container buildBody() {
    return Container();
  }

  /*Padding buildNextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: AppButton(
        text: "Finalizar",
        icon: Icons.done,
        onPressed: () => {},
      ),
    );
  }*/
}
