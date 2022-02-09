import 'package:delibery_app/Widgets/backButton.dart';
import 'package:delibery_app/Widgets/loader.dart';
import 'package:delibery_app/Widgets/snackbar.dart';
import 'package:delibery_app/config/colors/colors.dart';
import 'package:delibery_app/pages/login_page/provider/login_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                      width: double.infinity,
                      height: alto * 0.5,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/login-fondo.jpeg')),
                  Container(
                    child: backButton(Colors.white, context),
                    margin: EdgeInsets.only(top: 50.0),
                  )
                ],
              ),
              Transform.translate(
                  offset: Offset(0.0, -20),
                  child: Container(
                    width: double.infinity,
                    height: alto * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Bienvenido',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 26.0),
                          ),
                          Text(
                            'Selecciona una direccion y el dia y hora de reparto',
                            style: TextStyle(
                                color: gris,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0),
                          ),
                          Form(
                              key: keyForm,
                              child: Column(
                                children: [
                                  _emailinput(),
                                  _passwordinput(),
                                  _loginButton(),
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: GestureDetector(
                              onTap: () => {},
                              child: Text('Contraseña olvidada?'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Aun no tienes cuenta?',
                                  style: TextStyle(
                                      color: gris,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
                                ),
                                GestureDetector(
                                  onTap: ()=> Navigator.pushNamed(context,'register'),
                                  child: Text('Registro',
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.0,
                                      )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailinput() {
    return Container(
      height: 50.0,
      margin: EdgeInsets.only(top: 40.0),
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(142, 142, 147, 1.2),
          borderRadius: BorderRadius.circular(30.0)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailCtrl,
        validator:
        ValidationBuilder().email('Debe serun email validos').build(),
        decoration: InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }

  Widget _passwordinput() {
    return Container(
      height: 50.0,
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(142, 142, 147, 1.2),
          borderRadius: BorderRadius.circular(30.0)),
      child: TextFormField(
        obscureText: true,
        controller: passCtrl,
        validator:
        ValidationBuilder().minLength(6, 'Minimo 6 caracteres').build(),
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      width: 350.0,
      height: 50.0,
      margin: EdgeInsets.only(top: 30.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        child: Text('Entrar'),
        onPressed: () {
          //Validar los inputs
          var valid = keyForm.currentState?.validate();
          if (valid == true) {
            Map<String, dynamic> user = {
              'username': emailCtrl.text,
              'password': passCtrl.text
            };
            //TODO: Login
            LoginProvider loginProvider =
            Provider.of<LoginProvider>(context, listen: false);
            final Future<String> text = loginProvider.login(user, context);
            loginProvider.loginSt == LoginStatus.Authenticating
                ? loading(context)
                : Navigator.pop(context);
            text.then((msg) {
              if (loginProvider.loginSt == LoginStatus.NotLoggedIn) {
                //Pintar un mensaje con el error en un snackBar
                snackBar(context, msg);
              }
            });
          }
        },
      ),
    );
  }
}
