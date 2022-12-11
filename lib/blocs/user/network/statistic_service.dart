
import 'package:aeah_work_safety/services/base_api.dart';
import 'package:http/http.dart' as http;

class StatisticService extends BaseAPI {
  Future<http.Response> getGeneralStatistic() async {
    http.Response statisticResponse = await http.get(Uri.parse(super.statisticPath), headers: super.headers);
    return statisticResponse;
  }
}
