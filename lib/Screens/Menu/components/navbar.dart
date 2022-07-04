import 'package:flutter/material.dart';
import 'package:tap_take/components_main/list_menu.dart';
import 'package:tap_take/constants.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kPrimaryDarkColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Nome Teste",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: const Text(
              "exemplo@gmail.com",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  "assets/images/foto_perfil_teste.png",
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              image: DecorationImage(
                image: AssetImage("assets/images/food_dark.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListMenu(icon: Icons.restaurant, text: "Restaurante", press: () {}),
          ListMenu(icon: Icons.edit, text: "Editar Perfil", press: () {}),
          ListMenu(icon: Icons.school, text: "Universidades", press: () {}),
          ListMenu(
              icon: Icons.shopping_cart_outlined,
              text: "Carrinho",
              press: () {}),
          ListMenu(icon: Icons.card_travel, text: "Pedidos", press: () {}),
          ListMenu(icon: Icons.delivery_dining, text: "Delivery", press: () {}),
        ],
      ),
    );
  }
}
