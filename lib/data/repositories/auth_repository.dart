import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:video_elearning/data/model/request/RegisterRequest.dart';
import 'package:video_elearning/data/model/responses/RegisterResponse.dart';

// import '../model/request/Register.dart';

class AuthService {
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    const _baseUrl = 'api.escuelajs.co';
    try {
      final url = Uri.https(_baseUrl, '/api/v1/users');
      final response = await http.post(url,
          // headers: {'Content-Type': 'application/json'},
          body: registerRequest.toMap()
      );
      final result = RegisterResponse.fromJson(response.body);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}