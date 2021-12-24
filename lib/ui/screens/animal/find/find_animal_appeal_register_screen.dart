import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';
import 'package:miauche/ui/widgets/buttons/app_button.dart';
import 'package:miauche/ui/widgets/fields/app_text_form_field.dart';
import 'package:miauche/ui/widgets/indicator/app_indicator.dart';

import '../../../widgets/dialog/app_alert_dialog.dart';

class FindAnimalAppealRegisterScreen extends StatefulWidget {
  const FindAnimalAppealRegisterScreen({Key? key}) : super(key: key);

  @override
  _FindAnimalAppealRegisterScreenState createState() =>
      _FindAnimalAppealRegisterScreenState();
}

class _FindAnimalAppealRegisterScreenState
    extends State<FindAnimalAppealRegisterScreen> {
  File? _animalFile;
  final ImagePicker _picker = ImagePicker();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newsTitleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future getImage({required ImageSource source}) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _animalFile = File(pickedFile!.path);
    });
  }

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
      child: const AppIndicator(selectedAppeal: true),
    );
  }

  Container buildBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const AppText(
                label:
                    "ATENÇÃO!\nEsta tela refere-se à notícia vista por outros usuários. Você não precisa preenche-la, somente se quiser.",
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _newsTitleController,
              label: "Nome da notícia:",
              hintText: "Insira aqui o nome da notícia...",
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              maxLines: 4,
              controller: _descriptionController,
              keybordType: TextInputType.multiline,
              label: "Descrição:",
              hintText: "Insira aqui uma descrição...",
            ),
            const SizedBox(height: 16),
            buildImagePicker(),
            buildDoneButton(),
          ],
        ),
      ),
    );
  }

  TextButton buildImagePicker() {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => buildImageDialog(),
        );
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: AppColors.darkBlue,
          ),
        ),
        child: _animalFile == null
            ? const Center(
                child: AppText(
                  label: "Selecione uma\nimagem",
                ),
              )
            : Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(_animalFile!),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  buildImageDialog() {
    return AlertDialog(
      actions: [
        buildOption(
          name: "Câmera",
          icon: Icons.camera_alt,
          source: ImageSource.camera,
        ),
        buildOption(
          name: "Galeria",
          icon: Icons.perm_media,
          source: ImageSource.gallery,
        ),
      ],
    );
  }

  CupertinoDialogAction buildOption({
    required String name,
    required IconData icon,
    required ImageSource source,
  }) {
    return CupertinoDialogAction(
      child: Row(
        children: [
          AppText(
            label: name,
            fontSize: 24,
            isBold: true,
          ),
          const SizedBox(width: 16),
          Icon(icon, size: 32),
        ],
      ),
      onPressed: () {
        getImage(source: source);
      },
    );
  }

  void onLastStep() {
    bool valid;
    valid = _formKey.currentState!.validate();
    if (valid == true) {
      showDialog(
        context: context,
        builder: (_) => const AppAlertDialog(
          icon: Icons.highlight_remove_outlined,
          text: "Cadastro Concluído!",
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => const AppAlertDialog(
          icon: Icons.highlight_remove_outlined,
          text: "Dados do formulário inválidos!",
          description: "Verifique se digitou tudo certo.",
        ),
      );
    }
  }

  AppButton buildDoneButton() {
    return AppButton(
      text: "Finalizar",
      icon: Icons.done,
      onPressed: () => {},
    );
  }
}
