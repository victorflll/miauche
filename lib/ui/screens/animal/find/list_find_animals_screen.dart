import 'package:flutter/material.dart';
import 'package:miauche/data/find_animal_dao.dart';
import 'package:miauche/domain/models/find_animal_model.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';
import 'package:miauche/ui/widgets/card/app_card.dart';
import 'package:miauche/ui/widgets/fields/app_text_form_field.dart';

class ListFindAnimalsScreen extends StatefulWidget {
  const ListFindAnimalsScreen({Key? key}) : super(key: key);

  @override
  _ListFindAnimalsScreenState createState() => _ListFindAnimalsScreenState();
}

class _ListFindAnimalsScreenState extends State<ListFindAnimalsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _filter = TextEditingController();

  Future<List<FindAnimal>>? list;

  @override
  void initState() {
    super.initState();
    list = FindAnimalDAO().listAnimalsFound();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BaseAppBar(label: "Listagem"),
            buildTitle(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          const AppText(
            label: "Animais Encontrados",
            fontSize: 32,
            color: AppColors.darkBlue,
            isBold: true,
          ),
          buildFilterButton(),
        ],
      ),
    );
  }

  Padding buildFilterButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: AppTextFormField(
          controller: _filter,
          keybordType: TextInputType.text,
          label: "Filtrar:",
          hintText: "Filtro de pesquisa",
          suffixIcon: InkWell(
            child: const Icon(Icons.search),
            onTap: () {},
          ),
        ),
      ),
    );
  }

  buildBody() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: buildFutureList(),
    );
  }

  buildFutureList() {
    return FutureBuilder<List<FindAnimal>>(
      future: list,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildListView(snapshot.data!);
        } else {
          return const Expanded(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  ListView buildListView(List<FindAnimal> list) {
    return ListView.builder(
      primary: true,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            AppCard(
              animalType: list[index].animalType!,
              description: list[index].description!,
              phoneContact: list[index].phoneContact ?? "",
              imagePath: list[index].imagePath!,
              findAnimal: list[index],
              isFind: true,
            ),
            const SizedBox(height: 16)
          ],
        );
      },
    );
  }
}
