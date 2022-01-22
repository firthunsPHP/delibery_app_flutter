import 'package:delibery_app/config/colors/colors.dart';
import 'package:delibery_app/widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      statusBarIconBrightness: Brightness.light
    ));
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
                    image: AssetImage('assets/images/login-fondo.jpeg')  ),
                  Container(
                    child: backButton(Colors.white, context),
                    margin: EdgeInsets.only(top:50.0),
                  )
                ],
              ),
              Transform.translate(
                offset: Offset(0.0 , -20.0),
                child: Container(
                  width: double.infinity  ,
                  height: alto * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0) ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text('Bienvenido',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 26.0       ),
                         ),
                            Text('Accede a tu cuenta',
                              style: TextStyle(
                                  color: gris,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0
                              )
                            ),
                        Form(
                          key: keyForm,
                          child:  Column(
                            children: [
                              _emailinput(),
                              _passwordInput(),
                              _loginButton(),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:20.0),
                          child: GestureDetector(
                            onTap: () =>{},
                              child: Text('¿Contraseña olvidada?')
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              )
            ],
          ),

        ),
      )
    );
  }

  _emailinput() {}

  _passwordInput() {}

  _loginButton() {}
}
