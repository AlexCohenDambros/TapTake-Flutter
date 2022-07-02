import 'package:flutter/material.dart';
import 'package:tap_take/constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          buildDivider(),
          const Text(
            " OU ",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        color: Colors.white,
      ),
    );
  }
}