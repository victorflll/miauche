import 'package:flutter/material.dart';
import 'package:miauche/ui/screens/animal/choose_register_animal_screen.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(builder: (context) {
        return buildCallDrawer(context);
      }),
      drawer: buildDrawer(context),
      body: buildBody(context),
    );
  }

  FloatingActionButton buildCallDrawer(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Scaffold.of(context).openDrawer(),
      child: const Icon(Icons.menu),
      backgroundColor: AppColors.violet,
    );
  }

  Container buildDrawer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.person, size: 64),
              const SizedBox(width: 16),
              Column(
                children: const [
                  AppText(label: "Usuário"),
                  AppText(label: "email@email.com"),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const AppText(label: "Editar perfil"),
              const SizedBox(height: 8),
              const AppText(label: "Seus animais perdidos"),
              const SizedBox(height: 8),
              const AppText(label: "Seus animais encontrados"),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    label: "Sair da conta",
                    color: Colors.red.shade900,
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.logout,
                    color: Colors.red.shade900,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Center buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildListButton(
                label: "Animais\nPerdidos",
                imagePath: "assets/images/cat-lost.png",
                onPressed: () {},
              ),
              buildListButton(
                label: "Animais\nEncontrados",
                imagePath: "assets/images/dog-find.png",
                onPressed: () {},
              ),
            ],
          ),
          buildRegisterAnimalButton(context),
        ],
      ),
    );
  }

  TextButton buildRegisterAnimalButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => const ChooseRegisterAnimalScreen(),
        );
      },
      child: Column(
        children: const [
          Icon(
            Icons.pets_sharp,
            size: 86,
            color: AppColors.violet,
          ),
          AppText(
            label: "Cadastrar",
            color: AppColors.darkBlue,
            isBold: true,
            fontSize: 18,
          ),
        ],
      ),
    );
  }

  TextButton buildListButton({
    required String label,
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          AppText(
            label: label,
            color: AppColors.darkBlue,
            isBold: true,
            fontSize: 18,
          ),
          Image.asset(
            imagePath,
            fit: BoxFit.scaleDown,
            width: 160,
            color: AppColors.violet,
          ),
        ],
      ),
    );
  }
}
