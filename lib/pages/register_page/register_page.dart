import 'package:delibery_app/Widgets/backButton.dart';
import 'package:delibery_app/Widgets/input.dart';
import 'package:delibery_app/Widgets/loader.dart';
import 'package:delibery_app/Widgets/snackbar.dart';
import 'package:delibery_app/pages/register_page/provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {


  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController apellidosCtrl = TextEditingController();
  TextEditingController telefonoCtrl = TextEditingController();

  get newUser => null;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (_){
          return backButton(Colors.black, context);
        } )  ),
      body: SingleChildScrollView(
        child: Center(
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                Text(  'Crear cuenta nueva',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0    ),
                ),
                  SizedBox(height: 30.0),
                  _usernameinput(),
                  _userapellidosinput(),
                  _phoneInput(),
                  _emailInput(),
                  _passwordInput(),
                  _registerButton(context),
                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Text('Presionando en registrar, acepta los siguientes Términos y Condiciones',
                    textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                          fontSize: 13.0       ),
                    ),

                  )



              ]),

          ),

        ),
      ),
    );

  }

 Widget _userapellidosinput() {
    return inputWidget( apellidosCtrl, 'Apellidos', false, TextInputType.text);
  }

  Widget _usernameinput() {
    return inputWidget( nameCtrl, 'Nombre', false, TextInputType.text);
  }

  Widget  _phoneInput() {
    return inputWidget( telefonoCtrl, 'telefono', false, TextInputType.text);
  }

  Widget  _emailInput() {
    return inputWidget( emailCtrl, 'Email', false, TextInputType.text);
  }

  Widget _passwordInput() {
    return inputWidget( passCtrl, 'Password', false, TextInputType.text);
  }

  Widget  _registerButton(BuildContext context) {
    return Container(
      width: 370.0,
      height: 45.0,
      margin: EdgeInsets.only(top:30.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          child: Text('Crear cuenta'),
          onPressed: () {
            Map<String, dynamic> newUser = {
              'user': {
                'email': emailCtrl.text,
                'password': passCtrl.text
              },
              'rol': 'ROLE_CLIENTE'
            };
            Map<String, dynamic> userData = {
              'nombre': nameCtrl.text,
              'apellidos': apellidosCtrl.text,
              'telefono': telefonoCtrl.text
            };
            RegisterProvider provider = Provider.of<RegisterProvider>(
                context, listen: false);

            final Future<String> text = provider.register(newUser,userData, context);

            provider.regStatus == RegStatus.Registered ? loading(context) : Navigator.pop(context);

            text.then((value){
              if(provider.regStatus == RegStatus.NotRegistered){
                snackBar(context, value);
              }
            });

          },
        ),

    );
  }
}
