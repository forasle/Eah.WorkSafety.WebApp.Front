import 'dart:convert';
import 'package:aeah_work_safety/blocs/auth/models/login_request.dart';
import 'package:aeah_work_safety/blocs/user/models/user_request.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:aeah_work_safety/services/jwt_decoder.dart';
import 'package:http/http.dart' as http;

class UserService extends BaseAPI {
  Future<http.Response> getUserData(UserRequest userRequest) async {
    Map<String,dynamic> user = parseJwt(userRequest.loginResponse.token);
    String token = userRequest.loginResponse.token;
    headers["Authorization"]= "Bearer $token";
    http.Response userResponse = await http.get(Uri.parse(super.usersPath+'/'+user['id']), headers: super.headers);
    return userResponse;
  }
}
