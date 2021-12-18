import 'package:flutter/material.dart';
import 'package:miauche/data/dao/user_dao.dart';
import 'package:miauche/data/shared_preferences_helper.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splash(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return buildBody(width);
  }

  Container buildBody(double width) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: width,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.darkBlue,
            AppColors.background,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
      ),
      child: buildLogo(width: width),
    );
  }

  buildLogo({required width}) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Image.asset(
              "assets/images/dog.png",
              fit: BoxFit.scaleDown,
              width: width * .4,
            ),
          ),
          Image.asset(
            "assets/images/gato.png",
            fit: BoxFit.scaleDown,
            width: width * .4,
          ),
        ],
      ),
    );
  }

  void splash(context) {
    Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      _loadData();
    });
  }

  _loadData() async {
    SharedPreferencesHelper sharedPreferences = SharedPreferencesHelper();
    Map<String, String> isLogged = await sharedPreferences.getUser();

    String email = isLogged['email']!;
    String password = isLogged['password']!;

    final data = await UserDAO().fetchUserByEmailAndPassword(
      email: email,
      password: password,
    );

    if (email != "visitante@ifal.edu.br" && email.isNotEmpty) {
      Navigator.pushNamed(context, "/home-screen", arguments: data[0]);
    } else if (email.isEmpty || email == "visitante@ifal.edu.br") {
      Navigator.popAndPushNamed(context, "/login-screen");
    }
  }
}
