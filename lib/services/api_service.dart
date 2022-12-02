import 'dart:developer';
import 'package:http/http.dart' as http;

import '../models/user.dart';
import 'api_constants.dart';

class ApiService {
  Future<List<User>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<User> _model = userFromJson(response.body) as List<User>;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}