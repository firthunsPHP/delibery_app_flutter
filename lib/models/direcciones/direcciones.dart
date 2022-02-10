import 'dart:convert';

import 'direccione.dart';

class Direcciones {
  List<Direccion>? direcciones;

  Direcciones({this.direcciones});

  factory Direcciones.fromMap(Map<String, dynamic> data) => Direcciones(
        direcciones: (data['direcciones'] as List<dynamic>?)
            ?.map((e) => Direccion.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'direcciones': direcciones?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Direcciones].
  factory Direcciones.fromJson(String data) {
    return Direcciones.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Direcciones] to a JSON string.
  String toJson() => json.encode(toMap());
}
