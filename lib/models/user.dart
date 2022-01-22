import 'dart:convert';


class User{
  int? id;
  String? email;
  List<dynamic>? roles;
 String? password;
  String? token;


  User({this.id, this.email, this.roles, this.password, this.token});

  factory User.fromMap(Map<String, dynamic> data) => User(
    id: data['id'] as int?,
    email: data['email'] as String?,
    roles: data['roles'] as List<dynamic>?,
    password: data['password'] as String?,
    token: data['token'] as String?

  );
  Map<String, dynamic> toMap() => {
    'id': id,
    'email': email,
    'roles': roles,
    'password': password,
    'token': token,
  };

 factory User.fromJson(String data){
   return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

}