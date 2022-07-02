import 'package:flutter/material.dart';
import 'package:tap_take/components_main/text_field_container.dart';
import 'package:tap_take/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: const TextStyle(color: kSecondaryColor, fontSize: 18),
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kSecondaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}