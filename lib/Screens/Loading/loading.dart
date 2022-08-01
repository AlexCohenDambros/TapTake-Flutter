import 'package:flutter/material.dart';
import 'package:tap_take/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      width: double.infinity,
      backgroundColor: kSecondaryColor,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Image.asset(
              "assets/images/fundo.png",
              width: size.width,
            ),
          ),
          Positioned(
            top: 50,
            child: Image.asset(
              "assets/images/logo.png",
              width: size.width * 0.8,
            ),
          ),
          Positioned(
            top: 370,
            left: 0,
            child: Image.asset(
              "assets/images/animation.gif",
              width: size.width,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
