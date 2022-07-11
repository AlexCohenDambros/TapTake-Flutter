import 'package:flutter/material.dart';
import 'package:tap_take/components_main/rounded_button.dart';
import 'package:tap_take/constants.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  PaymentState createState() => PaymentState();
}

class PaymentState extends State<Payment> {
// ignore: unused_field
  final List<Map<String, dynamic>> _allFormsPayment = [
    {
      "id": 1,
      "name": "DINHEIRO",
      "image": "assets/images/dinheiroPayment.png",
    },
    {
      "id": 2,
      "name": "PIX",
      "image": "assets/images/pixPayment.png",
    },
    {
      "id": 3,
      "name": "CARTÃO",
      "image": "assets/images/cartaoPayment.png",
    },
  ];

  late String selectedPayment = "Nenhuma";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagamento"),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _allFormsPayment.isNotEmpty
                  ? ListView.builder(
                      itemCount: _allFormsPayment.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_allFormsPayment[index]["id"]),
                        color: Colors.grey[850],
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(20),
                          horizontalTitleGap: 10,
                          minVerticalPadding: 10,
                          onTap: () {
                            setState(() {
                              selectedPayment = _allFormsPayment[index]['name'];
                            });
                          },
                          leading:
                              Image.asset(_allFormsPayment[index]['image']),
                          title: Text(
                            _allFormsPayment[index]['name'],
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'Nenhuma forma de pagamento foi encontrado!',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              // ignore: unnecessary_brace_in_string_interps
              "Opção escolhida: ${selectedPayment}",
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Próximo",
              press: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const Payment(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              color: kPrimaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
