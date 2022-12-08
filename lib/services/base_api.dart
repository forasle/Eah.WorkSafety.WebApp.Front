

class BaseAPI{
static String base = "http://10.7.23.15";
static var api = base + "/api";
var usersPath = api + "/user";
var authPath = api + "/auth/SignIn";
// more routes
Map<String,String> headers = {
  "Content-Type": "application/json; charset=UTF-8" };

}