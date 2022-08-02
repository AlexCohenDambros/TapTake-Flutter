import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tap_take/constants.dart';

class UserCredentialServices with ReadyNotifier {
  UserCredentialServices() {
    setup();
  }

  Future<void> setup() async {
    await Hive.openBox("Credentials");
    getReady();
  }

  String? getToken() {
    var box = Hive.box("Credentials");
    return box.get("token").replaceAll('"', '');
  }

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://172.21.3.58:8090/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      var box = Hive.box("Credentials");
      await box.put("token", response.body);

      return true;
    } else {
      return false;
    }
  }

  Future<void> deleteToken() async {
    var box = Hive.box("Credentials");
    await box.delete("token");
  }
}
