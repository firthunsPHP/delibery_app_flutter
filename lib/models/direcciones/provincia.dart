import 'dart:convert';

class Provincia {
  int? id;
  String? provincia;

  Provincia({this.id, this.provincia});

  factory Provincia.fromMap(Map<String, dynamic> data) => Provincia(
        id: data['id'] as int?,
        provincia: data['provincia'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'provincia': provincia,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Provincia].
  factory Provincia.fromJson(String data) {
    return Provincia.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Provincia] to a JSON string.
  String toJson() => json.encode(toMap());
}
