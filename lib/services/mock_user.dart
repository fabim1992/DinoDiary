import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockUser {
  final String imagePath;
  final String name;
  final String email;
  final int numberRegisters;
  final bool isDarkMode;

  const MockUser(
      {required this.imagePath,
      required this.name,
      required this.email,
      required this.numberRegisters,
      required this.isDarkMode});

  MockUser copy({
    String? imagePath,
    String? name,
    String? email,
    int? numberRegisters,
    bool? isDarkMode,
  }) =>
      MockUser(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        numberRegisters: numberRegisters ?? this.numberRegisters,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );

  static MockUser fromJson(Map<String, dynamic> json) => MockUser(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        numberRegisters: json['numberRegisters'],
        isDarkMode: json['isDarkMode'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'numberRegisters': numberRegisters,
        'isDarkMode': isDarkMode,
      };
}

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';

  static final myUser = MockUser(
    imagePath:
        'https://uploads.metropoles.com/wp-content/uploads/2021/07/21170852/Joao-Gomes4.jpg',
    name: 'Joao Gomes',
    email: FirebaseAuth.instance.currentUser?.email ?? 'default@example.com',
    numberRegisters: 50,
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(MockUser user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static MockUser getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : MockUser.fromJson(jsonDecode(json));
  }
}
