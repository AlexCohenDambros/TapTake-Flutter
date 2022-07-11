import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            primary: color,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          ),
          child: Text(text,
              style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontFamily: "Kanit",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600))),
    );
  }
}
