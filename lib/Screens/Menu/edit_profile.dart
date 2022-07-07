import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tap_take/Screens/Menu/components/navbar.dart';
import 'package:tap_take/Screens/Menu/restaurants.dart';
import 'package:tap_take/components_main/rounded_button.dart';
import 'package:tap_take/components_main/rounded_input_field.dart';
import 'package:tap_take/constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChangePictureState createState() => _ChangePictureState();
}

class _ChangePictureState extends State<EditProfile> {
  /// Variables
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text("Editar Perfil"),
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.05, child: Container()),
              // ignore: unnecessary_null_comparison
              imageFile == null
                  ? ClipOval(
                      child: Image.asset(
                        "assets/images/foto_perfil_teste.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    )
                  : ClipOval(
                      child: Image.file(
                        imageFile!,
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                      ),
                    ),

              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _getFromGallery();
                    },
                    child: const Text(
                      "Alterar foto de perfil ",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.05),
              RoundedInputField(
                  hintText: "Seu nome",
                  onChanged: (value) {},
                  icon: Icons.account_circle),
              SizedBox(height: size.height * 0.02),
              RoundedInputField(
                  hintText: "Seu email",
                  onChanged: (value) {},
                  icon: Icons.email),
              SizedBox(height: size.height * 0.02),
              RoundedInputField(
                hintText: "Sua nova senha",
                onChanged: (value) {},
                icon: Icons.password,
              ),
              SizedBox(height: size.height * 0.08),
              RoundedButton(
                text: "ENVIAR",
                press: () {
                  showAlertDialog(context);
                },
                color: kPrimaryColor,
                textColor: Colors.white,
              ),
              SizedBox(height: size.height * 0.02),
              //SizedBox(height: size.height * 0.1),
            ],
          ),
        ));
  }

  showAlertDialog(BuildContext context) async {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancelar"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continuar"),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MenuScreen(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Alterar dados"),
      content: const Text("Você tem certeza de que deseja alterar seus dados?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
