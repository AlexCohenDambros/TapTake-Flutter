import 'package:flutter/material.dart';
import 'package:tap_take/Screens/SplashScreen/splash_screen.dart';
import 'package:tap_take/constants.dart';

void main() {
  runApp(const TapTake());
}

class TapTake extends StatelessWidget {
  const TapTake({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TapTake',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryDarkColor),
      home: const SplashScreen(),
    );
  }
}
