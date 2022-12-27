
import 'package:aeah_work_safety/blocs/auth/models/login_response.dart';
import 'package:aeah_work_safety/blocs/user/models/user_request.dart';
import 'package:aeah_work_safety/blocs/employee/network/employee_service.dart';
import 'package:aeah_work_safety/blocs/user/network/statistic_service.dart';
import 'package:aeah_work_safety/blocs/user/network/user_service.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:http/http.dart';


class StatisticRepository {
  StatisticService statisticService = locator<StatisticService>();

  Future<Response> getGeneralStatistic(LoginResponse loginResponse) async {
    return await statisticService.getGeneralStatistic(loginResponse);
  }
}
