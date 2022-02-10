import 'dart:convert';

class User {
  int? id;
  int? cliente;
  String? email;
  List<dynamic>? roles;
  String? password;
  String? token;

  User(
      {this.id,
      this.email,
      this.roles,
      this.password,
      this.token,
      this.cliente});

  factory User.fromMap(Map<String, dynamic> data) => User(
      id: data['id'] as int?,
      cliente: data['cliente'] as int?,
      email: data['email'] as String?,
      roles: data['roles'] as List<dynamic>?,
      password: data['password'] as String?,
      token: data['token'] as String?);

  Map<String, dynamic> toMap() => {
        'id': id,
        'cliente': cliente,
        'email': email,
        'roles': roles,
        'password': password,
        'token': token
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());
}
