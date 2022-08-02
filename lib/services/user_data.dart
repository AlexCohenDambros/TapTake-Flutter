import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:tap_take/constants.dart';
import 'package:tap_take/services/user_credentials.dart';

class UserDataServices with ReadyNotifier {
  UserDataServices() {
    setup();
  }

  Future<void> setup() async {
    await Hive.openBox("UserData");
    getReady();
  }

  String? getName() {
    var box = Hive.box("UserData");
    return box.get("Name") as String?;
  }

  String? getEmail() {
    var box = Hive.box("UserData");
    return box.get("Email") as String?;
  }

  String? getProfilePicture() {
    var box = Hive.box("UserData");
    return box.get("ProfilePicture") as String?;
  }

  Future<void> getDataUser() async {
    final response = await http.get(
      Uri.parse('http://172.21.3.58:8090/user/userData'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer ${GetIt.I.get<UserCredentialServices>().getToken()}'
      },
    );

    if (response.statusCode == 200) {
      UserData.fromJson(jsonDecode(response.body));
    } else {}
  }
}

class UserData {
  final String id;
  final String name;
  final String email;
  final String profilePicture;

  const UserData({
    required this.name,
    required this.id,
    required this.email,
    required this.profilePicture,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        id: json['ID'],
        name: json['Name'],
        email: json['Email'],
        profilePicture: json['ProfilePicture']);
  }
}
