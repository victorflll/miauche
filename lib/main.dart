import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miauche/ui/screens/animal/find/find_animal_general_register_screen.dart';
import 'package:miauche/ui/screens/home_screen.dart';
import 'package:miauche/ui/screens/login_screen.dart';
import 'package:miauche/ui/screens/animal/lost/lost_animal_general_register_screen.dart';
import 'package:miauche/ui/screens/user/user_register_screen.dart';
import 'package:miauche/ui/styles/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Miauche',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.generalTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/user-register-screen': (context) => UserRegisterScreen(),
        '/home-screen': (context) => const HomeScreen(),
        '/lost-animal-general-register-screen': (context) =>
            const LostAnimalGeneralRegisterScreen(),
        //'/lost-animal-adress-register-screen': (context) => const LostAnimalAdressRegisterScreen(),
        //'/lost-animal-appeal-register-screen': (context) => const LostAnimalAppealRegisterScreen(),
        '/find-animal-general-register-screen': (context) =>
            const FindAnimalGeneralRegisterScreen(),
        //'/find-animal-adress-register-screen': (context) => const FindAnimalAdressRegisterScreen(),
        //'/find-animal-appeal-register-screen': (context) => const FindAnimalAppealRegisterScreen(),
      },
    );
  }
}
