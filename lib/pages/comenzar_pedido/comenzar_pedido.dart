import 'package:delibery_app/config/colors/colors.dart';
import 'package:delibery_app/pages/comenzar_pedido/provider/direcciones_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:provider/provider.dart';

import 'modales/add_direccion.dart';

class ComenzarPedido extends StatefulWidget {
  ComenzarPedido({Key? key}) : super(key: key);

  @override
  State<ComenzarPedido> createState() => _ComenzarPedidoState();
}

class _ComenzarPedidoState extends State<ComenzarPedido> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DireccionesProvider provider =
    Provider.of<DireccionesProvider>(context, listen: false);
    provider.getProvincias();
  }

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
                            'Comienza tu pedido',
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
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () => {
                                  showMaterialModalBottomSheet(
                                    expand: false,
                                    context: context,
                                    builder: (context) => AddDireccion(),
                                  )
                                },
                                child: Text('Crear nueva direccion',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0)),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Direccion de envio',
                                  style: TextStyle(
                                      color: gris,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
                                ),
                              ],
                            ),
                          ),
                          //TODO: Cosumer con o la direcciones o un boton para
                          // seleccionar la direccion desde un modal
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Fecha de entrega',
                                    style: TextStyle(
                                        color: gris,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0)),
                              ],
                            ),
                          ),
                          //TODO: Cosumer con o la fecha o un boton para
                          // seleccionar la fecha desde un modal
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
}
