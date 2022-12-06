import 'package:aeah_work_safety/services/api_constants.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<User>> getUserData() async{
    List<User> _list=[];
    var response = await http.get(Uri.parse("http://localhost/api/user"));

    debugPrint(response.body.toString());
    return _list;
  }
}