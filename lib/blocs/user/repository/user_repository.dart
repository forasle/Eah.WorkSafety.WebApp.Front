
import 'package:aeah_work_safety/blocs/user/models/user_request.dart';
import 'package:aeah_work_safety/blocs/user/network/user_service.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:http/http.dart';


class UserRepository {
  UserService userService = locator<UserService>();

  Future<Response> getUserData({required UserRequest userRequest}) async {
    return await userService.getUserData(userRequest);
  }
}
