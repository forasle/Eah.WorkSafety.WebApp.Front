import 'package:aeah_work_safety/blocs/auth/models/login_request.dart';
import 'package:aeah_work_safety/blocs/auth/network/auth_service.dart';
import 'package:aeah_work_safety/services/locator.dart';
import 'package:http/http.dart';


class AuthRepository {
  AuthService authService = locator<AuthService>();

  Future<Response> signIn({required LoginRequest loginRequest}) async {
    return await authService.signIn(loginRequest);
  }
}
