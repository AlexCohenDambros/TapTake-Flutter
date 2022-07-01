import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child, required bool resizeToAvoidBottomInset, required bool resizeToAvoidBottomPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/fundo.png",
              width: size.width,
              height: 120,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: Image.asset(
              "assets/images/logo.png",
              width: size.width * 0.2,
            ),
          ),
          const Positioned(
            top: 30,
            child: Text("LOGIN",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: "Kanit",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
          ),
          Positioned(
            top: 120,
            left: 0,
            child: Image.asset(
              "assets/images/food_light.png",
              width: size.width,
              height: 500,
              fit: BoxFit.fill,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
