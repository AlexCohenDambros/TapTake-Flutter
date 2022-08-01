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
}
