import 'dart:convert';

Map<String, dynamic> parseJwt(String token) {
  Map<String,dynamic> result={};
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  result['role']=payloadMap['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'];
  result['username']=payloadMap['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'];
  result['id']=payloadMap['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'].toString();
  return result;
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}
