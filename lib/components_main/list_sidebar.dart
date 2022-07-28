import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback press;
  final Color color;
  const ListMenu({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.normal, color: color),
      ),
      onTap: press,
    );
  }
}
