import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tap_take/Screens/Menu/cart.dart';
import 'package:tap_take/Screens/Menu/delivery.dart';
import 'package:tap_take/Screens/Menu/edit_profile.dart';
import 'package:tap_take/Screens/Menu/order.dart';
import 'package:tap_take/Screens/Menu/restaurants.dart';
import 'package:tap_take/Screens/Menu/university.dart';
import 'package:tap_take/Screens/SplashScreen/splash_screen.dart';
import 'package:tap_take/components_main/list_sidebar.dart';
import 'package:tap_take/constants.dart';
import 'package:tap_take/services/user_credentials.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    super.initState();
    GetUserToken();
  }

  void GetUserToken() async {}

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
          ListMenu(
              icon: Icons.restaurant,
              text: "Restaurantes",
              color: Colors.white,
              press: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const MenuScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }),
          ListMenu(
              icon: Icons.edit,
              text: "Editar Perfil",
              color: Colors.white,
              press: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const EditProfile(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }),
          ListMenu(
              icon: Icons.school,
              text: "Universidades",
              color: Colors.white,
              press: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const University(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }),
          ListMenu(
              icon: Icons.shopping_cart_outlined,
              text: "Carrinho",
              color: Colors.white,
              press: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const Cart(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }),
          ListMenu(
              icon: Icons.card_travel,
              text: "Pedidos",
              color: Colors.white,
              press: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const Order(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }),
          ListMenu(
              icon: Icons.delivery_dining,
              text: "Delivery",
              color: Colors.white,
              press: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const Delivery(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }),
          ListMenu(
              icon: Icons.logout,
              text: "Sair",
              color: kPrimaryColor,
              press: () {
                showAlertDialog(context);
              }),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) async {
    // set up the buttons
    // user must tap button!
    Widget cancelButton = TextButton(
      child: const Text("Cancelar"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Confirmar"),
      onPressed: () async {
        GetIt.I.get<UserCredentialServices>().deleteToken();
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SplashScreen(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Deslogar"),
      content: const Text("Você tem certeza de que deseja sair de sua conta?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
