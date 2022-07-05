import 'package:flutter/material.dart';
import 'package:tap_take/Screens/Menu/components/body.dart';
import 'package:tap_take/Screens/Menu/components/navbar.dart';
import 'package:tap_take/constants.dart';

class Delivery extends StatelessWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Delivery"),
        backgroundColor: kPrimaryColor,
      ),
      body: const Body(),
    );
  }
}