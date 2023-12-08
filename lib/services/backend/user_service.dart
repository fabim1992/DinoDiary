import 'dart:developer';

import 'package:dino_diary/common/http_helper.dart';
import 'package:dino_diary/models/user.dart';

class UserService {
  Future<UsersList> list({int skip = 0, int limit = 10}) async {
    try {
      final response = await dio
          .get('/users/', queryParameters: {'skip': skip, 'limit': limit});
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        final data = response.data;
        final users = UsersList.fromJson(data);
        return users;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to list users');
    }
  }

  Future<User> find(int id) async {
    try {
      final response = await dio.get('/users/$id');
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        final data = response.data;
        final user = User.fromJson(data);
        return user;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to find user');
    }
  }

  Future<User> profile() async {
    try {
      final response = await dio.get('/users/profile');
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        final data = response.data;
        final user = User.fromJson(data);
        return user;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to get profile');
    }
  }

  Future<bool> delete() async {
    try {
      final response = await dio.delete('/users/');
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        return true;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to delete user');
    }
  }

  Future<User> update(String? name, String? avatar, String? email,
      Map<String, dynamic>? configs) async {
    try {
      Map<String, dynamic> payload = {};
      if (name != null) {
        payload['name'] = name;
      }
      if (avatar != null) {
        payload['avatar'] = avatar;
      }
      if (email != null) {
        payload['email'] = email;
      }
      if (configs != null) {
        payload['configs'] = configs;
      }
      if (payload.isEmpty) {
        throw Exception('Empty payload');
      }
      final response = await dio.put('/users/', data: payload);
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        final data = response.data;
        final user = User.fromJson(data);
        return user;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to update profile');
    }
  }
}
