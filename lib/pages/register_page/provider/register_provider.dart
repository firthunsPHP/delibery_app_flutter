import 'dart:convert';

import 'package:delibery_app/config/api/api_url.dart';
import 'package:delibery_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

enum RegStatus{
  NotRegistered,
  Registered,
  Registering
}

class RegisterProvider extends ChangeNotifier{
  RegStatus _regStatus = RegStatus.NotRegistered  ;

  set regSatus(RegStatus status){
    _regStatus = status;
  }

  RegStatus get regStatus => _regStatus;
  Future<String> register(Map<String, dynamic> newUser,
      Map<String, dynamic> userData, BuildContext context) async{
    // cambiamos el estado
    _regStatus = RegStatus.Registering;

    notifyListeners();
    Response response = await post(Uri.parse(Api.register),
      body: json.encode(newUser),
      headers: {
      'Content-Type': 'application/json'
      }
    );
    if( response.statusCode == 200){
      User user = User.fromJson(response.body);

      userData['user'] = user.id;
      // envio los datos del user

      bool msg = await setUserData(userData);
      if(msg){
        Navigator.pushReplacementNamed(context, 'login');
        return '';
      }


    }

    _regStatus = RegStatus.NotRegistered;
    notifyListeners();
    return 'Fallo de registro, inténtelo de nuevo más tarde';

  }
  Future<bool>setUserData(Map<String,dynamic > userdata)async{
    Response response = await post(Uri.parse(Api.clienteCreate),
    body: json.encode(userdata),
      headers: {
      'Content-Type': 'application/json',
      }
    );
    if(response.statusCode == 200) return true;
    return false;
  }
}























