import 'package:flutter/material.dart';
import 'package:tap_take/Screens/Login/login_screen.dart';
import 'package:tap_take/Screens/SignUp/signup_screen.dart';
import 'package:tap_take/Screens/SplashScreen/components/background.dart';
import 'package:tap_take/components_main/rounded_button.dart';
import 'package:tap_take/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.15),
            const Text("Ja possui conta? Então clique aqui.",
                style: TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.center),
            RoundedButton(
              text: "ENTRAR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
              color: kPrimaryColor,
              textColor: Colors.white,
            ),
            SizedBox(height: size.height * 0.03),
            const Text("Ainda não possui conta? Crie agora.",
                style: TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.center),
            RoundedButton(
              text: "CADASTRAR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
              color: Colors.white,
              textColor: kSecondaryColor,
            ),
            SizedBox(height: size.height * 0.01),
          ]),
    );
  }
}
