import 'dart:developer';

import 'package:dino_diary/common/http_helper.dart';
import 'package:dino_diary/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final storage = const FlutterSecureStorage();

  AuthService() {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      log(options.data.toString(), name: 'onRequest');
      final accessToken = await storage.read(key: ApiConstants.accessTokenKey);
      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onResponse: (response, handler) {
      log(response.toString(), name: 'onResponse');
      return handler.next(response);
    }, onError: (error, handler) async {
      // Check for token expired error
      log(error.toString(), name: 'onError');
      if (error.response?.statusCode == 401) {
        await storage.delete(key: ApiConstants.accessTokenKey);
      }

      return handler.next(error);
    }));
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/',
        data: {'name': name, 'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final accessToken = data['token'];
        // final refreshToken = data['refresh_token'];

        await storage.write(
            key: ApiConstants.accessTokenKey, value: accessToken);
        // await storage.write(
        //     key: ApiConstants.refreshTokenKey, value: refreshToken);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final accessToken = data['token'];
        // final refreshToken = data['refresh_token'];

        await storage.write(
            key: ApiConstants.accessTokenKey, value: accessToken);
        // await storage.write(
        //     key: ApiConstants.refreshTokenKey, value: refreshToken);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // Future<void> refreshAccessToken() async {
  //   final refreshToken = await storage.read(key: ApiConstants.refreshTokenKey);
  //   if (refreshToken != null) {
  //     try {
  //       final response = await dio.post(
  //         '/refresh-token',
  //         data: {'refresh_token': refreshToken},
  //       );

  //       final accessToken = response.data['access_token'];
  //       if (accessToken != null) {
  //         await storage.write(
  //             key: ApiConstants.accessTokenKey, value: accessToken);
  //         return;
  //       }
  //     } catch (e) {
  //       print('Failed to refresh access token: $e');
  //     }
  //   }

  //   // Clear stored tokens if refresh token is invalid or refresh request fails
  //   await storage.delete(key: ApiConstants.accessTokenKey);
  //   await storage.delete(key: ApiConstants.refreshTokenKey);
  // }

  Future<void> logout() async {
    await storage.delete(key: ApiConstants.accessTokenKey);
    // await storage.delete(key: ApiConstants.refreshTokenKey);
  }
}
