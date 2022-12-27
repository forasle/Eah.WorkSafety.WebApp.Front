
import 'dart:convert';

import 'package:aeah_work_safety/blocs/auth/models/login_response.dart';
import 'package:aeah_work_safety/blocs/user/models/statistic_response.dart';
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class StatisticService extends BaseAPI {
  Future<StatisticResponse> getGeneralStatistic() async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: "token");

    headers["Authorization"]= "Bearer $token";
    http.Response statisticResponse = await http.get(Uri.parse(super.statisticPath), headers: super.headers);
    final statisticResponseJson = jsonDecode(statisticResponse.body);
    final DateTime lastAccidentDay = DateTime.parse(statisticResponseJson['dayOfLastAccident']);
    final int dayWithoutAccident = DateTime.now().difference(lastAccidentDay).inDays;
    statisticResponseJson['dayWithoutAccident'] = dayWithoutAccident;
    final statisticResponseModel = StatisticResponse.fromJson(statisticResponseJson);
    return statisticResponseModel;
  }
}
