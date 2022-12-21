class BaseAPI {
  static String base = "http://10.7.23.15";
  //static String base = "http://192.168.1.30";
  static var api = base + "/api";
  var usersPath = api + "/user";
  var employeesPath = api + "/employee";
  var authPath = api + "/auth/SignIn";
  var statisticPath = api + "/statistics";

// more routes
  Map<String, String> headers = {"Content-Type": "application/json; charset=UTF-8"};
}
