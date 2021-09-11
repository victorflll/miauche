import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';

class ListLostAnimalsScreen extends StatefulWidget {
  const ListLostAnimalsScreen({Key? key}) : super(key: key);

  @override
  _ListLostAnimalsScreenState createState() => _ListLostAnimalsScreenState();
}

class _ListLostAnimalsScreenState extends State<ListLostAnimalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BaseAppBar(label: "Listagem"),
            buildTitle(),
            //buildForm(),
          ],
        ),
      ),
    );
  }

  Padding buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: AppText(
        label: "Animais Perdidos",
        fontSize: 32,
        color: AppColors.darkBlue,
        isBold: true,
      ),
    );
  }
}
