import 'package:flutter/material.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';

class ListFindAnimalsScreen extends StatefulWidget {
  const ListFindAnimalsScreen({Key? key}) : super(key: key);

  @override
  _ListFindAnimalsScreenState createState() => _ListFindAnimalsScreenState();
}

class _ListFindAnimalsScreenState extends State<ListFindAnimalsScreen> {
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
        label: "Animais Encontrados",
        fontSize: 32,
        color: AppColors.darkBlue,
        isBold: true,
      ),
    );
  }
}
