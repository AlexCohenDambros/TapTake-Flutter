import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tap_take/Screens/Login/components/background.dart';
import 'package:tap_take/Screens/Menu/restaurants.dart';
import 'package:tap_take/Screens/SignUp/signup_screen.dart';
import 'package:tap_take/components_main/already_have_an_account_acheck.dart';
import 'package:tap_take/components_main/check_token.dart';
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

Future<void> _showDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alerta Login'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Você deve inserir um e-mail e uma senha válidos!')
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Confirmar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<User?> Login(String email, String password) async {
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
    var check_token = CheckToken();
    // ignore: unnecessary_null_comparison
    if (check_token != null) {
      var box = await Hive.openBox("Login");
      box.put("token", "teste");
    }
    return User.fromJson(jsonDecode(response.body));
  } else {
    return null;
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
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.25),
            RoundedInputField(
                hintText: "Email",
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
            SizedBox(height: size.height * 0.18),
            visibility
                ? Text(
                    "Credenciais inválidas! Tente novamente!",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                : Container(),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                if (email == null || password == null) {
                  _showDialog(context);
                  return;
                }
                User? usuario = await Login(email!, password!);
                if (usuario == null) {
                  setState(() {
                    visibility = true;
                  });
                } else {
                  visibility = false;
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MenuScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                }
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
