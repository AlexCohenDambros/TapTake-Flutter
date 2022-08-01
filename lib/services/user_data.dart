import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class UserDataServices {
  Future<void> setup() async {
    await Hive.openBox("UserData");
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

  String? getToken() {
    var box = Hive.box("Credentials");
    return box.get("token") as String?;
  }

  Future<void> getDataUser() async {
    final response = await http.get(
      Uri.parse('http://172.21.3.58:8090/user/userData'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Autorization': 'Bearer  $getToken()'
      },
    );
  }
}
