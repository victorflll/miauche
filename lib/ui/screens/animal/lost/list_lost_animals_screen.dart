import 'package:flutter/material.dart';
import 'package:miauche/data/lost_animal_dao.dart';
import 'package:miauche/domain/models/lost_animal_model.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';
import 'package:miauche/ui/widgets/appbar/base_appbar.dart';
import 'package:miauche/ui/widgets/card%20and%20dialog/app_card.dart';
import 'package:miauche/ui/widgets/fields/app_text_form_field.dart';

class ListLostAnimalsScreen extends StatefulWidget {
  const ListLostAnimalsScreen({Key? key}) : super(key: key);

  @override
  _ListLostAnimalsScreenState createState() => _ListLostAnimalsScreenState();
}

class _ListLostAnimalsScreenState extends State<ListLostAnimalsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _filter = TextEditingController();

  Future<List<LostAnimal>>? list;

  @override
  void initState() {
    super.initState();
    list = LostAnimalDAO().listAnimalsLost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildFutureList();
        },
        child: const Icon(Icons.refresh_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            label: "Animais Perdidos",
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
    return FutureBuilder<List<LostAnimal>>(
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

  ListView buildListView(List<LostAnimal> list) {
    return ListView.builder(
      primary: true,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return AppCard(
          animalType: list[index].animalType!,
          description: list[index].description!,
          phoneContact: list[index].phoneContact ?? "",
          imagePath: list[index].imagePath!,
          lostAnimal: list[index],
        );
      },
    );
  }
}
