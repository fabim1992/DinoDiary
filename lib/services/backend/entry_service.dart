import 'dart:developer';

import 'package:dino_diary/common/http_helper.dart';
import 'package:dino_diary/models/entry.dart';

class EntryService {
  Future<Entry> create(String title, String content, String? status,
      Map<String, dynamic>? configs, String? createdAt) async {
    try {
      if (title.isEmpty || content.isEmpty) {
        throw Exception('Cannot create entry with empty title or content');
      }
      Map<String, dynamic> payload = {'title': title, 'content': content};
      if (status != null) {
        payload['status'] = status;
      }
      if (configs != null) {
        payload['configs'] = configs;
      }
      if (createdAt != null) {
        payload['createdAt'] = createdAt;
      }

      final response = await dio.post('/entries/', data: payload);
      log(response.toString(), name: 'response');

      if (response.statusCode == 201) {
        final data = response.data;
        final entry = Entry.fromJson(data);
        return entry;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to create entry');
    }
  }

  Future<EntriesList> list(
      {int skip = 0, int limit = 10, String date = ""}) async {
    try {
      final response = await dio.get('/entries/',
          queryParameters: {'skip': skip, 'limit': limit, 'date': date});
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        final data = response.data;
        final entries = EntriesList.fromJson(data);
        return entries;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to list entries');
    }
  }

  Future<Entry> find(int id) async {
    try {
      final response = await dio.get('/entries/$id');
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        final data = response.data;
        final entry = Entry.fromJson(data);
        return entry;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to find entry');
    }
  }

  Future<Entry> update(int id, String? title, String? content, String? status,
      Map<String, dynamic>? configs) async {
    try {
      Map<String, dynamic> payload = {};
      if (title != null) {
        payload['title'] = title;
      }
      if (content != null) {
        payload['content'] = content;
      }
      if (status != null) {
        payload['status'] = status;
      }
      if (configs != null) {
        payload['configs'] = configs;
      }
      if (payload.isEmpty) {
        throw Exception('Empty payload');
      }
      final response = await dio.put('/entries/$id', data: payload);
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        final data = response.data;
        final entry = Entry.fromJson(data);
        return entry;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to update entry');
    }
  }

  Future<bool> delete(int id) async {
    try {
      final response = await dio.delete('/entries/$id');
      log(response.toString(), name: 'response');

      if (response.statusCode == 200) {
        return true;
      } else {
        throw newApiError(response);
      }
    } catch (e) {
      throw Exception('Failed to delete entry');
    }
  }
}
