import 'dart:convert';

class User {
  final String? username;
  final String? email;
  final String? password;
  final String? password_confirmation;


User ({
    this.username,
    required this.email,
    required this.password,
    this.password_confirmation,
});


Map<String, dynamic> toMap() {
    return { 'email': email,
      'name': username,
     
      'password': password,
      'password_confirmation': password_confirmation,
    };
  }

String tojason() => jsonEncode(toMap());







}

