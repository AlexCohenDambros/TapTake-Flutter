import 'package:flutter/material.dart';
import 'package:tap_take/Screens/Menu/components/navbar.dart';
import 'package:tap_take/constants.dart';

class University extends StatefulWidget {
  const University({Key? key}) : super(key: key);

  @override
  UniversityPageState createState() => UniversityPageState();
}

class UniversityPageState extends State<University> {
  // ignore: unused_field
  final List<Map<String, dynamic>> _allUniversity = [
    {
      "id": 1,
      "name": "PUCPR",
      "description":
          "Endereço: R. Imac. Conceição, 1155 - Prado Velho, Curitiba - PR, 80215-901",
      "favorite": false
    },
    {
      "id": 2,
      "name": "UNICURITIBA",
      "description":
          "Endereço: R. Chile, 1678 - Rebouças, Curitiba - PR, 80220-181",
      "favorite": false
    },
    {
      "id": 3,
      "name": "POSITIVO",
      "description":
          "Endereço: 5.300, R. Prof. Pedro Viriato Parigot de Souza, 5300 - Campo Comprido, Curitiba - PR, 81280-330",
      "favorite": false
    },
    {
      "id": 4,
      "name": "PUCSP",
      "description":
          "Endereço: R. Monte Alegre, 984 - Perdizes, São Paulo - SP, 05014-901",
      "favorite": false
    },
    {
      "id": 5,
      "name": "PUC-RIO",
      "description":
          "Endereço: Terminal da PUC - Gávea, Rio de Janeiro - RJ, 22541-041",
      "favorite": false
    },
    {
      "id": 5,
      "name": "PUCRS",
      "description":
          "Endereço: Av. Ipiranga, 6681 - Partenon, Porto Alegre - RS, 90619-900",
      "favorite": false
    },
  ];

  // ignore: unused_field
  List<Map<String, dynamic>> _foundUniversity = [];

  @override
  initState() {
    _foundUniversity = _allUniversity;
    super.initState();
  }

  // ignore: unused_element
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUniversity;
    } else {
      results = _allUniversity
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundUniversity = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Universidades"),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[850],
                  contentPadding: const EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  hintText: "Buscar universidades"),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUniversity.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUniversity.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUniversity[index]["id"]),
                        color: Colors.grey[850],
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                            onTap: () {},
                            contentPadding: const EdgeInsets.all(20),
                            horizontalTitleGap: 10,
                            minVerticalPadding: 10,
                            title: Text(
                              _foundUniversity[index]['name'],
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              _foundUniversity[index]['description'],
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                            trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _foundUniversity[index]['favorite']
                                      ? IconButton(
                                          icon: const Icon(
                                            Icons.star_rate,
                                            size: 30.0,
                                            color: kPrimaryColor,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _foundUniversity[index]
                                                  ['favorite'] = false;
                                            });
                                          },
                                        )
                                      : IconButton(
                                          icon: const Icon(
                                            Icons.star_border,
                                            size: 30.0,
                                            color: kPrimaryColor,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _foundUniversity[index]
                                                  ['favorite'] = true;
                                            });
                                          },
                                        )
                                ])),
                      ),
                    )
                  : const Text(
                      'Nenhuma Universidade foi encontrada!',
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
