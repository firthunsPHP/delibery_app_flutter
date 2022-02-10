import 'dart:convert';

class Municipio {
  int? id;
  String? municipio;

  Municipio({this.id, this.municipio});

  factory Municipio.fromMap(Map<String, dynamic> data) => Municipio(
        id: data['id'] as int?,
        municipio: data['municipio'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'municipio': municipio,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Municipio].
  factory Municipio.fromJson(String data) {
    return Municipio.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Municipio] to a JSON string.
  String toJson() => json.encode(toMap());
}
