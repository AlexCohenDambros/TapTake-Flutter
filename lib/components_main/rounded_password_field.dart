import 'package:flutter/material.dart';
import 'package:tap_take/components_main/text_field_container.dart';
import 'package:tap_take/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: const TextStyle(color: kSecondaryColor, fontSize: 20),
        obscureText: true,
        onChanged: onChanged,
        decoration: const InputDecoration(
          icon: Icon(Icons.lock, color: kSecondaryColor),
          suffixIcon: Icon(
            Icons.visibility,
            color: kSecondaryColor,
          ),
          hintText: "Sua senha",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
