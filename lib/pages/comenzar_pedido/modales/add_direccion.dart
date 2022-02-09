import 'package:delibery_app/Widgets/input.dart';
import 'package:delibery_app/models/direcciones/municipio.dart';
import 'package:delibery_app/models/direcciones/provincia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDireccion extends StatefulWidget {
  const AddDireccion({Key? key}) : super(key: key);

  @override
  _AddDireccionState createState() => _AddDireccionState();
}

class _AddDireccionState extends State<AddDireccion> {


  TextEditingController calleCtrl = TextEditingController();
  TextEditingController numeroCtrl = TextEditingController();
  TextEditingController puertaCtrl = TextEditingController();
  TextEditingController codPostalCtrl = TextEditingController();
  Provincia? provincia;
  Municipio? municipio;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Container(), middle: Text('Nueva dirección'),
      ),
      child: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text('Complete el formulario',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0  )    ),
                  _nombreCalle(),
                  Row(
                    children: [
                      Flexible(child: _numero(), ),
                      Flexible(flex: 2, child: _puerta())
                    ],
                  ),
                  _codPostal(),
                  _addButton(),
                ],
              ))),
      ));
  }
 Widget _nombreCalle() {
return inputWidget(calleCtrl,'Nombre de la calle', false, TextInputType.text);
  }

  Widget _numero() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: inputWidget(numeroCtrl,'Número', false, TextInputType.text)
    );
  }

 Widget _puerta() {
   return inputWidget(puertaCtrl,'Puerta, piso, escalera', false, TextInputType.number);
 }

  _codPostal(){
    return inputWidget(codPostalCtrl,'Código postal', false, TextInputType.number);
  }

  // _addButton() {}



}
