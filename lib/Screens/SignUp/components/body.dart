import 'package:flutter/material.dart';
import 'package:tap_take/Screens/Login/login_screen.dart';
import 'package:tap_take/Screens/SignUp/components/background.dart';
import 'package:tap_take/Screens/SignUp/components/or_divider.dart';
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
                hintText: "Seu Nome",
                onChanged: (value) {},
                icon: Icons.account_circle),
            SizedBox(height: size.height * 0.05),
            RoundedInputField(
                hintText: "Seu Email",
                onChanged: (value) {},
                icon: Icons.person),
            SizedBox(height: size.height * 0.05),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.1),
            RoundedButton(
              text: "CADASTRAR",
              press: () {},
              color: kPrimaryColor,
              textColor: Colors.white,
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            ),
            SizedBox(height: size.height * 0.02),
            const OrDivider(),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialButton(
                  icon: Icons.facebook,
                  press: () {},
                ),
                SocialButton(
                  icon: Icons.email,
                  press: () {},
                ),
              ],
            )
            //SizedBox(height: size.height * 0.1),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback press;
  const SocialButton({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white),
            shape: BoxShape.circle),
        child: Icon(
          icon,
          size: 40,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
