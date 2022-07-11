import 'package:flutter/material.dart';
import 'package:tap_take/Screens/Menu/components/navbar.dart';
import 'package:tap_take/constants.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  DeliveryState createState() => DeliveryState();
}

class DeliveryState extends State<Delivery> {
// ignore: unused_field
  final List<Map<String, dynamic>> _allDelivery = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Delivery"),
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
              child: _allDelivery.isNotEmpty
                  ? ListView.builder(
                      itemCount: _allDelivery.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_allDelivery[index]["id"]),
                        color: Colors.grey[850],
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(20),
                          horizontalTitleGap: 10,
                          minVerticalPadding: 10,
                          leading: Image.asset(_allDelivery[index]['image']),
                          title: Text(
                            _allDelivery[index]['name'],
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'Sem entregas a serem realizadas no momento!',
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
