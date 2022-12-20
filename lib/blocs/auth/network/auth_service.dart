import 'dart:convert';
import 'package:aeah_work_safety/blocs/auth/models/login_request.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:http/http.dart' as http;

class AuthService extends BaseAPI {
  Future<http.Response> signIn(LoginRequest loginRequest) async {
    var body = jsonEncode({'userName': loginRequest.userName, 'password': loginRequest.password});
    http.Response authResponse = await http.post(Uri.parse(super.authPath), headers: super.headers, body: body);
    return authResponse;
  }
}