import 'dart:convert';

class RegisterRequest {
  RegisterRequest({
      this.name, 
      this.email, 
      this.password, 
      this.avatar = 'https://api.escuelajs.co/api/v1/files/0477.jpg',});

  factory RegisterRequest.fromMap(Map<String, dynamic> map) {
    return RegisterRequest(
      name:  map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      avatar: map['avatar'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory RegisterRequest.fromJson(String source) => RegisterRequest.fromMap(json.decode(source));

  final String? name;
  final String? email;
  final String? password;
  final String? avatar;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
    };
    }
  }

