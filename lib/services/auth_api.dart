import 'dart:convert';

import 'package:http/http.dart' as http;
import 'base_api.dart';

class AuthAPI extends BaseAPI{
  Future<http.Response> signIn(String name, String password) async {
    var body = jsonEncode(
      {'userName':name,'password':password}
    );
    http.Response response = await http.post(Uri.parse(super.authPath),headers: super.headers,body: body);
    return response;
  }
}