import 'package:flutter/material.dart';
import 'package:tap_take/Screens/Menu/components/body.dart';
import 'package:tap_take/Screens/Menu/components/navbar.dart';
import 'package:tap_take/constants.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Pedidos"),
        backgroundColor: kPrimaryColor,
      ),
      body: const Body(),
    );
  }
}