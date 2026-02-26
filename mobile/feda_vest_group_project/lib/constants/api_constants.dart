import 'package:feda_vest_group_project/config/env.dart';
import 'package:flutter/foundation.dart';
import 'package:envied/envied.dart';


class ApiConstants {
   static String get _api => '${Env.baseUrl}/api';

  static String get login => '$_api/v1/auth/login';
  static String get register => '$_api/v1/auth/register';
  static String get fetchUserProfile => '$_api/profile/me';
  static String get updateUserProfile => '$_api/profile/create';

  static String get adminLogin => '$_api/admin/login';

  static String get logout => '$_api/users/logout';
}

class Headers {
  static Map<String, String> authHeader(String bearerToken) => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $bearerToken",
      };

  static Map<String, String> unAuthHeader() => {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
}
