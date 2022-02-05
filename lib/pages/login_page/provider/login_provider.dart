import 'dart:convert';

import 'package:delibery_app/Providers/user_provider.dart';
import 'package:delibery_app/config/api/api_url.dart';
import 'package:delibery_app/config/preferences/shared_preferences.dart';
import 'package:delibery_app/models/user.dart';


import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

enum LoginStatus { NotLoggedIn, LoggedIn, Authenticating, LoggedOut }

class LoginProvider extends ChangeNotifier {
  LoginStatus _loginSt = LoginStatus.NotLoggedIn;

  LoginStatus get loginSt => _loginSt;

  set loginSt(LoginStatus status) {
    _loginSt = status;
    notifyListeners();
  }

  //Metodo para llamar al login de la Api
  Future<String> login(Map<String, dynamic> data, BuildContext context) async {
    _loginSt = LoginStatus.Authenticating;
    notifyListeners();

    Response response = await post(Uri.parse(Api.login),
        body: json.encode(data), headers: {'Content-Type': 'application/json'});

    print(response);
    if (response.statusCode == 200) {
      User user = User.fromJson(response.body);

      //Guardar user en shared
      UserPreferences().saveUserOnLogin(user);
      _loginSt = LoginStatus.LoggedIn;
      notifyListeners();
      //Notificamos el user provider que tenemos un user
      Provider.of<UserProvider>(context, listen: false).setUser(user);
      Navigator.pushNamed(context, 'welcome');
      return 'ok';
    }
    _loginSt = LoginStatus.NotLoggedIn;
    notifyListeners();
    if (response.statusCode == 401) {
      return 'Credenciales incorrectas';
    } else {
      return 'Ha ocurrido un error, intentelo mas tarde';
    }
  }
}
