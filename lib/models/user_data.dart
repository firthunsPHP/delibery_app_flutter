import 'dart:convert';

class UserData {
  int? id;
  String? nombre;
  String? apellidos;
  String? telefono;

  UserData({this.id, this.nombre, this.apellidos, this.telefono});

  factory UserData.fromMap(Map<String, dynamic> data) => UserData(
        id: data['id'] as int?,
        nombre: data['nombre'] as String?,
        apellidos: data['apellidos'] as String?,
        telefono: data['telefono'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'nombre': nombre,
        'apellidos': apellidos,
        'telefono': telefono,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserData].
  factory UserData.fromJson(String data) {
    return UserData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserData] to a JSON string.
  String toJson() => json.encode(toMap());
}
