import 'dart:convert';
import 'direccion.dart';

class Direcciones{

  List<Direccion>? direcciones;
  Direcciones({this.direcciones});

  factory Direcciones.fromMap(Map<String, dynamic> data) => Direcciones(
    direcciones: (data['direcciones'] as List<dynamic>?)
        ?.map((e) => Direccion.fromMap(e as Map<String, dynamic>))
        .toList(),
    );

  Map<String, dynamic> toMap()=>{
    'direcciones': direcciones?.map((e) => e.toMap()).toList(),
  };

  factory Direcciones.fromJson(String data) {
    return Direcciones.fromMap(jsonDecode(data) as Map<String, dynamic>);
  }

  String toJson()=> json.encode(toMap());


}