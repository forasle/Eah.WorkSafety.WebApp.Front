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
  var nearMissPath = api + "/nearMiss";
  var nearMissSearchPath = api + "/preventiveActivity/search/name?key=";
  var preventiveActivityPath = api + "/preventiveActivity";
  var preventiveActivitySearchPath = api + "/nearMiss/search/name?key=";
  var inconsistencyPath = api + "/inconsistency";
  var inconsistencySearchPath = api + "/inconsistency/search/name?key=";
  var missionPath = api + "/mission";
  var missionSearchPath = api + "/mission/search/name?key=";
  var chronicDiseasePath = api + "/chronicDisease";
  var chronicDiseaseSearchPath = api + "/chronicDisease/search/name?key=";
  var occupationDiseasePath = api + "/occupationDisease";
  var occupationDiseaseSearchPath = api + "/occupation/search/name?key=";
// more routes
  Map<String, String> headers = {"Content-Type": "application/json; charset=UTF-8"};
}
