

import 'dart:convert';

import 'package:delibery_app/config/api/api_url.dart';
import 'package:delibery_app/config/preferences/shared_preferences.dart';
import 'package:delibery_app/models/direcciones/provincia.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class DireccionesProvider extends ChangeNotifier{

  List<Provincia> provinciaList = [];
  List<Provincia> municipiosList = [];

  bool loading = false;


  Future<void> getProvincias() async {
    if( provinciaList.isEmpty){
      loading = true;
      notifyListeners();
      String token = await UserPreferences().userAccesToken;
      Response response = await get(Uri.parse(Api.provincias),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }
      );

      if( response.statusCode ==200){
        List<dynamic> jsonList = json.decode(response.body);
        provinciaList = List<Provincia>.from(jsonList.map((e) => Provincia.fromMap(e)));
        notifyListeners();
        loading = false;
        notifyListeners();

      }



    }
  }

}