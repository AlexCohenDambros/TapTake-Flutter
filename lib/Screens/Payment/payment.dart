import 'package:flutter/material.dart';
import 'package:tap_take/constants.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pagamento"),
          backgroundColor: kPrimaryColor,
        ),
        body: Container());
  }
}
