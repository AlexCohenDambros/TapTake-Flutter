import 'package:flutter/material.dart';
import 'package:tap_take/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      width: double.infinity,
      backgroundColor: kPrimaryColor,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Image.asset(
              "assets/images/logo.png",
              width: size.width * 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
