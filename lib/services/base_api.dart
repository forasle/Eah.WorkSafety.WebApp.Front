class BaseAPI {
  static String base = "http://10.7.23.15";
  //static String base = "http://192.168.1.30";
  //static String base = "http://192.168.1.30/api";
  static var api = base + "/api";
  var usersPath = api + "/user";
  static var employeePath = api + "/employee";
  static var employeeSearchPath = api + "/employee/search/name?key=";
  var authPath = api + "/auth/SignIn";
  var statisticPath = api + "/statistics";
  static var accidentPath = api + "/accident";
  static var accidentSearchPath = api + "/accident/search/name?key=";
  static var nearMissPath = api + "/nearMiss";
  static var nearMissSearchPath = api + "/nearMiss/search/name?key=";
  static var preventiveActivityPath = api + "/preventiveActivity";
  static var preventiveActivitySearchPath = api + "/nearMiss/search/name?key=";
  static var inconsistencyPath = api + "/inconsistency";
  static var inconsistencySearchPath = api + "/inconsistency/search/name?key=";
  var missionPath = api + "/mission";
  var missionSearchPath = api + "/mission/search/name?key=";
  static var chronicDiseasePath = api + "/chronicDisease";
  static var chronicDiseaseSearchPath = api + "/chronicDisease/search/name?key=";
  var occupationDiseasePath = api + "/occupationDisease";
  var occupationDiseaseSearchPath = api + "/occupation/search/name?key=";
// more routes
  Map<String, String> headers = {"Content-Type": "application/json; charset=UTF-8"};
}
