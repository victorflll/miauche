import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miauche/ui/screens/login_screen.dart';
import 'package:miauche/ui/screens/user_register_screen.dart';
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
        '/user-register-screen': (context) => const UserRegisterScreen(),
        //'/home-screen': (context) => const HomeScreen(),
      },
    );
  }
}
