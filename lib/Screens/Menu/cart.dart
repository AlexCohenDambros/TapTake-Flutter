import 'package:flutter/material.dart';
import 'package:tap_take/Screens/Menu/components/navbar.dart';
import 'package:tap_take/Screens/Scheduling/scheduling.dart';
import 'package:tap_take/components_main/rounded_button.dart';
import 'package:tap_take/constants.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  late bool buttonActive;

// ignore: unused_field
  final List<Map<String, dynamic>> _allItemsCart = [];

  @override
  initState() {
    if (_allItemsCart.isEmpty) {
      buttonActive = false;
    } else {
      buttonActive = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Carrinho"),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _allItemsCart.isNotEmpty
                  ? ListView.builder(
                      itemCount: _allItemsCart.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_allItemsCart[index]["id"]),
                        color: Colors.grey[850],
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(20),
                          horizontalTitleGap: 10,
                          minVerticalPadding: 10,
                          leading: Image.asset(_allItemsCart[index]['image']),
                          title: Text(
                            _allItemsCart[index]['name'],
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'Nenhum item foi encontrado no carrinho!',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
            ),
            RoundedButton(
              text: "Agendamento",
              press: buttonActive
                  ? () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Scheduling(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    }
                  : null,
              color: kPrimaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
