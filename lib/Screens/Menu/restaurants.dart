import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tap_take/Screens/Menu/components/navbar.dart';
import 'package:tap_take/constants.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Restaurantes"),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
          width: double.infinity,
          height: size.height,
          margin: const EdgeInsets.only(
            left: 14,
            top: 10,
          ),
          child: ListView(children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const <Widget>[
                  _allCategories(
                    image: "assets/images/salgado.png",
                    title: "Salgados",
                  ),
                  _allCategories(
                    image: "assets/images/cafeteria.png",
                    title: "Cafeterias",
                  ),
                  _allCategories(
                    image: "assets/images/lanches.png",
                    title: "Lanches",
                  ),
                  _allCategories(
                    image: "assets/images/doce.png",
                    title: "Doces",
                  ),
                  _allCategories(
                    image: "assets/images/salada.png",
                    title: "Saudável",
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SizedBox(
              height: 475,
              child: GridView.count(
                primary: false,
                crossAxisCount: 2,
                physics: const ScrollPhysics(),
                childAspectRatio: 0.8,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                scrollDirection: Axis.vertical,
                children: const [
                  _CardRestaurant(
                      image: "assets/images/logo.png",
                      title: "Restaurante 1",
                      ratingRes: 4.5),
                  _CardRestaurant(
                      image: "assets/images/logo.png",
                      title: "Restaurante 2",
                      ratingRes: 4.0),
                  _CardRestaurant(
                      image: "assets/images/logo.png",
                      title: "Restaurante 3",
                      ratingRes: 5.0),
                  _CardRestaurant(
                      image: "assets/images/logo.png",
                      title: "Restaurante 4",
                      ratingRes: 3.5),
                  _CardRestaurant(
                      image: "assets/images/logo.png",
                      title: "Restaurante 5",
                      ratingRes: 2.5),
                  _CardRestaurant(
                      image: "assets/images/logo.png",
                      title: "Restaurante 6",
                      ratingRes: 3.0),
                ],
              ),
            )
          ])),
    );
  }
}

// ignore: camel_case_types
class _allCategories extends StatelessWidget {
  final String image;
  final String title;
  const _allCategories({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image))),
            ),
            Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 18))
          ]),
    );
  }
}

// ignore: unused_element
class _CardRestaurant extends StatelessWidget {
  final String image;
  final String title;
  final double ratingRes;
  const _CardRestaurant({
    Key? key,
    required this.image,
    required this.title,
    required this.ratingRes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: Center(
                  child: CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 60,
                backgroundColor: Colors.transparent,
              )),
            ),
            SizedBox(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Center(
                    child: RatingBarIndicator(
                      itemSize: 20,
                      rating: ratingRes,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
