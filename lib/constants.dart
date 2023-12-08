import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get baseUrl {
    if (dotenv.env['ENV'] == 'PROD') {
      return dotenv.env['BASE_URL']!;
    } else {
      return 'http://localhost:3000/v1';
    }
  }

  static const String contentType = 'application/json';
  static const String accessTokenKey = 'accessToken';
  // static const String refreshTokenKey = 'refreshToken';
}
