class BaseAPI {
  //static String base = "http://10.7.23.15";
  static String base = "http://192.168.1.30";
  static var api = base + "/api";
  var usersPath = api + "/user";
  var employeePath = api + "/employee";
  var employeeSearchPath = api + "/employee/search/name?key=";
  var authPath = api + "/auth/SignIn";
  var statisticPath = api + "/statistics";
  var accidentPath = api + "/accident";
  var accidentSearchPath = api + "/accident/search/name?key=";

// more routes
  Map<String, String> headers = {"Content-Type": "application/json; charset=UTF-8"};
}
