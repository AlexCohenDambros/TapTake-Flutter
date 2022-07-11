import 'package:flutter/material.dart';
import 'package:tap_take/Screens/Menu/components/navbar.dart';
import 'package:tap_take/constants.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  OrderState createState() => OrderState();
}

class OrderState extends State<Order> {
// ignore: unused_field
  final List<Map<String, dynamic>> _allOrder = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Pedidos"),
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
              child: _allOrder.isNotEmpty
                  ? ListView.builder(
                      itemCount: _allOrder.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_allOrder[index]["id"]),
                        color: Colors.grey[850],
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(20),
                          horizontalTitleGap: 10,
                          minVerticalPadding: 10,
                          leading: Image.asset(_allOrder[index]['image']),
                          title: Text(
                            _allOrder[index]['name'],
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'Você ainda não realizou nenhum pedido!',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
