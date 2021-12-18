import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  Future<SharedPreferences> get _getInstance => SharedPreferences.getInstance();

  Map<String, String> login = {
    'email': 'visitante@ifal.edu.br',
    'password': 'senha123456',
  };

  SharedPreferencesHelper() {
    _startSettings();
  }

  _startSettings() async {
    await getUser();
  }

  getUser() async {
    SharedPreferences instance = await _getInstance;

    final email = instance.getString('email') ?? 'visitante@ifal.edu.br';
    final password = instance.getString('password') ?? 'senha123456';

    login = {
      'email': email,
      'password': password,
    };

    return login;
  }

  setUser(String email, String password) async {
    SharedPreferences instance = await _getInstance;

    await instance.setString('email', email);
    await instance.setString('password', password);

    await getUser();
  }

  logout() async {
    SharedPreferences instance = await _getInstance;

    await instance.remove('email');
    await instance.remove('password');
  }
}
