import 'package:flutter/material.dart';
import 'package:tap_take/Screens/Menu/components/body.dart';
import 'package:tap_take/Screens/Menu/components/navbar.dart';
import 'package:tap_take/constants.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Restaurantes"),
        backgroundColor: kPrimaryColor,
      ),
      body: const Body(),
    );
  }
}