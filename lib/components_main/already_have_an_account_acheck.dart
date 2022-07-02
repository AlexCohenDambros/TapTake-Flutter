import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    required this.login,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Ainda não possui uma conta ? " : "já possui uma conta ? ",
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Cadastrar." : "Login.",
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
