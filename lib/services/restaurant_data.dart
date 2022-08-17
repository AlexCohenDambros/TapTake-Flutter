import 'dart:convert';
import 'dart:ffi';

import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:tap_take/components_main/notifier.dart';
import 'package:tap_take/services/user_credentials.dart';

class RestaurantDataService with ReadyNotifier {
  RestaurantDataService() {
    setup();
  }

  Future<void> setup() async {
    await Hive.openBox("RestaurantData");
    getReady();
  }

  String getName() {
    var box = Hive.box("RestaurantData");
    if (box.get("Name") != null) {
      return box.get("Name") as String;
    }

    return "";
  }

  int getRating() {
    var box = Hive.box("RestaurantData");
    if (box.get("Rating") != null) {
      return box.get("Rating") as int;
    }
    return 0;
  }

  String getBanner() {
    var box = Hive.box("RestaurantData");
    if (box.get("Banner") != null) {
      return box.get("Banner") as String;
    }

    return "";
  }

  String getLogo() {
    var box = Hive.box("RestaurantData");
    if (box.get("Logo") != null) {
      return box.get("Logo") as String;
    }

    return "assets/images/logo.png";
  }

  Future<void> getDataRestaurant() async {
    final response = await http.get(
      Uri.parse('http://172.21.3.58:8090/restaurant'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer ${GetIt.I.get<>().getToken()}'
      },
    );

    if (response.statusCode == 200) {
      var restaurant = RestaurantData.fromJson(jsonDecode(response.body));
      var box = Hive.box("RestaurantData");
      await box.put("Name", restaurant.name);
      await box.put("Rating", restaurant.rating);
      //await box.put("Logo", restaurant.Logo);
    }
  }
}

class RestaurantData {
  final String id;
  final String idUni;
  final String name;
  final int rating;
  final String banner;
  final String logo;

  const RestaurantData({
    required this.id,
    required this.idUni,
    required this.name,
    required this.rating,
    required this.banner,
    required this.logo,
  });

  factory RestaurantData.fromJson(Map<String, dynamic> json) {
    return RestaurantData(
        id: json['ID'],
        idUni: json['IDUniversity'],
        name: json['Name'],
        rating: json['Rating'],
        banner: json['Banner'],
        logo: json['Logo']);
  }
}
