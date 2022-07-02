import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/fundo.png",
              width: size.width,
              height: 475,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              top: 25,
              left: 0,
              child: Image.asset("assets/images/food_dark.png",
                  width: size.width, height: 450, fit: BoxFit.fill)),
          child,
        ],
      ),
    );
  }
}