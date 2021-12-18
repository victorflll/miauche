import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miauche/data/shared_preferences_helper.dart';
import 'package:miauche/domain/models/user_model.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/dialog/choose_register_animal_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      floatingActionButton: Builder(builder: (context) {
        return buildCallDrawer(context);
      }),
      drawer: buildDrawer(context, user),
      body: buildBody(context, user),
    );
  }

  bool visitant(User user) {
    if (user.name != "Visitante") {
      return false;
    }
    return true;
  }

  FloatingActionButton buildCallDrawer(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Scaffold.of(context).openDrawer(),
      child: const Icon(Icons.menu),
      backgroundColor: AppColors.violet,
    );
  }

  Container buildDrawer(BuildContext context, User user) {
    final bool isVisitant = visitant(user);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildUserInformation(user),
          const SizedBox(height: 32),
          Visibility(
            visible: isVisitant,
            child: buildExitApp(),
            replacement: buildDrawerOptions(),
          ),
        ],
      ),
    );
  }

  Row buildUserInformation(User user) {
    final bool isVisitant = visitant(user);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.person, size: 64),
        const SizedBox(width: 16),
        Column(
          children: [
            AppText(
              label: user.name!,
              isBold: true,
              fontSize: 18,
            ),
            Visibility(
              visible: isVisitant,
              child: Container(),
              replacement: AppText(label: user.email!),
            ),
          ],
        ),
      ],
    );
  }

  Padding buildDrawerOptions() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(label: "Editar perfil"),
          const SizedBox(height: 8),
          const AppText(label: "Seus animais perdidos"),
          const SizedBox(height: 8),
          const AppText(label: "Seus animais encontrados"),
          const SizedBox(height: 8),
          buildExitApp(),
        ],
      ),
    );
  }

  ElevatedButton buildExitApp() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        shape: const StadiumBorder(),
        primary: AppColors.white,
      ),
      onPressed: () {
        SharedPreferencesHelper sharedPreferences = SharedPreferencesHelper();
        sharedPreferences.logout();
        SystemNavigator.pop();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            label: "Sair do aplicativo",
            color: Colors.red.shade900,
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.logout,
            color: Colors.red.shade900,
          ),
        ],
      ),
    );
  }

  Center buildBody(BuildContext context, User user) {
    final bool isVisitant = visitant(user);

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
                onPressed: () {
                  Navigator.pushNamed(context, "/list-lost-animals-screen");
                },
              ),
              buildListButton(
                label: "Animais\nEncontrados",
                imagePath: "assets/images/dog-find.png",
                onPressed: () {
                  Navigator.pushNamed(context, "/list-find-animals-screen");
                },
              ),
            ],
          ),
          Visibility(
            visible: isVisitant,
            child: Container(),
            replacement: buildRegisterAnimalButton(context),
          ),
        ],
      ),
    );
  }

  TextButton buildRegisterAnimalButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => const ChooseRegisterAnimalDialog(),
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
