import 'package:flutter/material.dart';
import 'package:tap_take/Screens/Login/components/background.dart';
import 'package:tap_take/Screens/SignUp/signup_screen.dart';
import 'package:tap_take/components_main/already_have_an_account_acheck.dart';
import 'package:tap_take/components_main/rounded_button.dart';
import 'package:tap_take/components_main/rounded_input_field.dart';
import 'package:tap_take/components_main/rounded_password_field.dart';
import 'package:tap_take/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.2),
            RoundedInputField(
                hintText: "Seu Email",
                onChanged: (value) {},
                icon: Icons.person),
            SizedBox(height: size.height * 0.05),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.2),
            RoundedButton(
              text: "LOGIN",
              press: () {},
              color: kPrimaryColor,
              textColor: Colors.white,
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
              login: true,
            )
          ],
        ),
      ),
    );
  }
}
