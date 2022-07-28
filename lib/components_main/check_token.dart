import 'package:hive_flutter/hive_flutter.dart';

Future<String?> CheckToken() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("Login");
  return box.get("token") as String?;
}
