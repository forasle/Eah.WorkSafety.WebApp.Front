import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_api.dart';

class UserAPI extends BaseAPI{
  Future<http.Response> userById(String id) async {
    http.Response response = await http.get(Uri.parse(super.usersPath+"/"+id));
    return response;
  }
}