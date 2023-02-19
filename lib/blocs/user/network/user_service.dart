import 'dart:convert';
import 'package:aeah_work_safety/blocs/user/models/user_response.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:aeah_work_safety/services/jwt_decoder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserService extends BaseAPI {
  Future<UserResponse> getUserData() async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    Map<String,dynamic> user = parseJwt(token!);
    headers["Authorization"]= "Bearer $token";
    http.Response userResponse = await http.get(Uri.parse(super.usersPath+'/'+user['id']), headers: super.headers);
    final userResponseJson = jsonDecode(userResponse.body);
    final UserResponse userResponseModel =UserResponse.fromJson(userResponseJson);
    return userResponseModel;
  }
}
