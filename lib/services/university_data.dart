import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:tap_take/components_main/notifier.dart';

class UniversityService with ReadyNotifier {
  UniversityService() {
    setup();
  }

  Future<void> setup() async {
    await Hive.openBox<UniversityData>("UniversityData");
    getReady();
  }

  List<UniversityData> getUniversities() {
    final uniList = Hive.box("UniversityData").values.toList();
    return uniList as List<UniversityData>;
  }

  Future<void> getAllUniversities() async {
    final response = await http.get(
      Uri.parse('http://172.21.3.58:8090/universities'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      //var userData = UniversityData.fromJson(jsonDecode(response.body));
      //var box = Hive.box("UserData");
      //await box.put(userData.id, userData);
    }
  }
}

class UniversityData {
  final String id;
  final String name;
  final String description;

  const UniversityData({
    required this.name,
    required this.id,
    required this.description,
  });

  factory UniversityData.fromJson(Map<String, dynamic> json) {
    return UniversityData(
        id: json['ID'], name: json['Name'], description: json['Description']);
  }
}
