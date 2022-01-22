import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // responsive
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/fondo-Welcome.jpeg')),
            ),child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX:1.0, sigmaY: 1.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center  ,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: ancho *0.1),
                child: Text('App Delivery',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: alto*0.05
                      ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child:Text('La mejor comida en tu cara',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                width:  ancho * 0.9,
                height: alto *0.057,
                child: ElevatedButton(
                  onPressed:  ()=> Navigator.pushNamed(context,'login'),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
                  child: Text('Entrar'),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
