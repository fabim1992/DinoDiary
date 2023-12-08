import 'dart:developer';

import 'package:dino_diary/common/http_helper.dart';
import 'package:dino_diary/models/assist.dart';

class AssistService {
  Future<AssistantsList> listAssistants({int skip = 0, int limit = 10}) async {
    try {
      final response = await dio.get('/users/assistants',
          queryParameters: {'skip': skip, 'limit': limit});
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        final data = response.data;
        final assistants = AssistantsList.fromJson(data);
        return assistants;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to list assistants');
    }
  }

  Future<AssistedUsersList> listAssistedUsers(
      {int skip = 0, int limit = 10}) async {
    try {
      final response = await dio.get('/users/assisted',
          queryParameters: {'skip': skip, 'limit': limit});
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        final data = response.data;
        final assistedUsers = AssistedUsersList.fromJson(data);
        return assistedUsers;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to list assisted users');
    }
  }

  Future<bool> deleteAssistantLink(int id) async {
    try {
      final response = await dio.delete('/users/assistants/$id');
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        return true;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to delete assistant link');
    }
  }

  Future<bool> deleteAssistedUserLink(int id) async {
    try {
      final response = await dio.delete('/users/assisted/$id');
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        return true;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to delete assisted user link');
    }
  }

  // ### Assist link request methods ###
  Future<AssistantsList> listAssistantsRequests(
      {int skip = 0, int limit = 10}) async {
    try {
      final response = await dio.get('/users/assistants/requests',
          queryParameters: {'skip': skip, 'limit': limit});
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        final data = response.data;
        final assistantsRequests = AssistantsList.fromJson(data);
        return assistantsRequests;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to list assistants requests');
    }
  }

  Future<AssistedUsersList> listAssistedUsersRequests(
      {int skip = 0, int limit = 10}) async {
    try {
      final response = await dio.get('/users/assisted/requests',
          queryParameters: {'skip': skip, 'limit': limit});
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        final data = response.data;
        final assistedUsersRequests = AssistedUsersList.fromJson(data);
        return assistedUsersRequests;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to list assisted users requests');
    }
  }

  Future<bool> requestAssistantLink(int id) async {
    try {
      final response = await dio.post('/users/assistants/$id');
      log(response.toString(), name: 'response');

      if (response.statusCode == 201) {
        return true;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to request assistant link');
    }
  }

  Future<bool> requestAssistedLink(int id) async {
    try {
      final response = await dio.post('/users/assisted/$id');
      log(response.toString(), name: 'response');

      if (response.statusCode == 201) {
        return true;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to request assisted user link');
    }
  }

  Future<bool> acceptAssistantLink(int id) async {
    try {
      final response = await dio.put('/users/assistants/$id');
      log(response.toString(), name: 'response');

      if (response.statusCode == 201) {
        return true;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to accept assistant link');
    }
  }

  Future<bool> acceptAssistedLink(int id) async {
    try {
      final response = await dio.put('/users/assisted/$id');
      log(response.toString(), name: 'response');

      if (response.statusCode == 201) {
        return true;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to accept assisted user link');
    }
  }
}
