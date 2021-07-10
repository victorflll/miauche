import 'package:flutter/material.dart';
import 'package:miauche/ui/widgets/base_appbar.dart';
import 'package:miauche/ui/widgets/buttons/app_button.dart';

class ChooseRegisterAnimalScreen extends StatelessWidget {
  const ChooseRegisterAnimalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const BaseAppBar(label: "Cadastrar"),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  text: "Animal Perdido",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/lost-animal-general-register-screen",
                    );
                  },
                ),
                AppButton(
                  text: "Animal Encontrado",
                  onPressed: () {
                    /*Navigator.pushNamed(
                      context,
                      "/find-animal-general-register-screen",
                    );*/
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
