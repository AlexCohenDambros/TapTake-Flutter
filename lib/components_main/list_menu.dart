import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback press;
  const ListMenu({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.normal, color: Colors.white),
      ),
      onTap: press,
    );
  }
}
