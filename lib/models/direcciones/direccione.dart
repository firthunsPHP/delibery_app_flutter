import 'dart:convert';

import 'municipio.dart';
import 'provincia.dart';

class Direccion {
  int? id;
  String? calle;
  String? numero;
  String? puertaPisoEscalera;
  int? codPostal;
  Municipio? municipio;
  Provincia? provincia;

  Direccion({
    this.id,
    this.calle,
    this.numero,
    this.puertaPisoEscalera,
    this.codPostal,
    this.municipio,
    this.provincia,
  });

  factory Direccion.fromMap(Map<String, dynamic> data) => Direccion(
        id: data['id'] as int?,
        calle: data['calle'] as String?,
        numero: data['numero'] as String?,
        puertaPisoEscalera: data['puertaPisoEscalera'] as String?,
        codPostal: data['codPostal'] as int?,
        municipio: data['municipio'] == null
            ? null
            : Municipio.fromMap(data['municipio'] as Map<String, dynamic>),
        provincia: data['provincia'] == null
            ? null
            : Provincia.fromMap(data['provincia'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'calle': calle,
        'numero': numero,
        'puertaPisoEscalera': puertaPisoEscalera,
        'codPostal': codPostal,
        'municipio': municipio?.toMap(),
        'provincia': provincia?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Direccione].
  factory Direccion.fromJson(String data) {
    return Direccion.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Direccion] to a JSON string.
  String toJson() => json.encode(toMap());
}
