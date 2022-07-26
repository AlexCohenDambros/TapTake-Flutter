import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tap_take/Screens/Login/components/background.dart';
import 'package:tap_take/Screens/Menu/restaurants.dart';
import 'package:tap_take/Screens/SignUp/signup_screen.dart';
import 'package:tap_take/components_main/already_have_an_account_acheck.dart';
import 'package:tap_take/components_main/rounded_button.dart';
import 'package:tap_take/components_main/rounded_input_field.dart';
import 'package:tap_take/components_main/rounded_password_field.dart';
import 'package:tap_take/constants.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

Future<User> Login(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://172.21.3.58:8090/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    print("logou");
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create user.');
  }
}

class User {
  final String email;
  final String name;
  final String profilePic;
  final String id;

  const User(
      {required this.email,
      required this.name,
      required this.profilePic,
      required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['Email'],
        name: json['Name'],
        profilePic: json['ProfilePicture'],
        id: json['ID']);
  }
}

class _BodyState extends State<Body> {
  String? email;
  String? password;

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
                onChanged: (value) {
                  email = value;
                },
                icon: Icons.person),
            SizedBox(height: size.height * 0.05),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: size.height * 0.2),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if (email == null || password == null) {
                  return;
                }
                Login(email!, password!);
              },
              color: kPrimaryColor,
              textColor: Colors.white,
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const SignUpScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
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
