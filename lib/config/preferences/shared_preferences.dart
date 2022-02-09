
import 'package:delibery_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{

  String _inMemoryToken = '';
  int _cliente = 0;

  Future<String> get userAccesToken async{
    if(_inMemoryToken.isNotEmpty){
      return _inMemoryToken;
    }

    _inMemoryToken = await _loadTokenFromShared();
    return _inMemoryToken;
  }

  Future<int> get cliente async{
    if(_cliente != 0){
      return _cliente;
    }

    _cliente = await _loadClienteFromShared();
    return _cliente;
  }

  Future<int> _loadClienteFromShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var cliente = 0;
    final cliente_id = prefs.getString('id_cliente');

    if(cliente_id != null){
      cliente = cliente_id as int;
    }
    return cliente;

  }



  Future<String> _loadTokenFromShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var accesToken = '';
    final token = prefs.getString('token');

    if(token != null){
      accesToken = token;
    }
    return accesToken;

  }



  Future<bool> saveUserOnLogin(User user) async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', user.token!);
    prefs.setInt('id_user', user.id!);
    prefs.setInt('id_cliente', user.cliente!);

    return true;
  }


}