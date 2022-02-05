
import 'package:delibery_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{
  Future<bool> saveUserOnLogin(User user) async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', user.token!);
    prefs.setInt('id_user', user.id!);

    return true;
  }
}