import 'dart:convert';

class RegisterResponse {
    String email;
    String password;
    String name;
    String avatar = 'https://api.escuelajs.co/api/v1/files/0477.jpg';
    String role;
    int id;
    DateTime createdAt;
    DateTime updatedAt;

    RegisterResponse({
        required this.email,
        required this.password,
        required this.name,
        required this.avatar,
        required this.role,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
    });

    factory RegisterResponse.fromJson(String json) => RegisterResponse.fromMap(jsonDecode(json));
    String toJson() => jsonEncode(toMap());

    factory RegisterResponse.fromMap(Map<String, dynamic> json) => RegisterResponse(
        email: json["email"],
        password: json["password"],
        name: json["name"],
        avatar: json["avatar"],
        role: json["role"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "name": name,
        "avatar": avatar,
        "role": role,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}