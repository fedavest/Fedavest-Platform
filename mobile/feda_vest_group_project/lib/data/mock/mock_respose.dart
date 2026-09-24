import 'dart:convert';
import 'package:http/http.dart' as http;

http.Response mockResponse(Map<String, dynamic> body, int statusCode) {
  return http.Response(jsonEncode(body), statusCode);
}