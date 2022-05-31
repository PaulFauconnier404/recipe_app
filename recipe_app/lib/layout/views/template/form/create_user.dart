import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/model/user_provider.dart';

class Create_User extends StatefulWidget {
  const Create_User({Key? key}) : super(key: key);

  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Create_User_State createState() {
    return _Create_User_State();
  }
}

class _Create_User_State extends State<Create_User> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String? name;
  String? firstname;
  String? pseudo;
  String? email;
  String? password;
  String? verifPassword;

  void submitForm() {
    formKey.currentState?.save();

    print(name);
    print(firstname);
    print(pseudo);
    print(email);
    print(password);
    print(verifPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
        ),
        child: Column(
          children: [
            Top_Bar(scaffoldKey: _scaffoldKey),
            Second_App_Title(text1: "Créer un ", text2: "compte"),
            Form(
              key: formKey,
              child: Column(children: [
                Container(
                  width: 300,
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    onSaved: (value) => name = value,
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF909090)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF202020)),
                        ),
                        labelText: 'Nom',
                        labelStyle: const TextStyle(
                          color: Color(0xFF424242),
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                Container(
                  width: 300,
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    onSaved: (value) => firstname = value,
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF909090)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF202020)),
                        ),
                        labelText: 'Prénom',
                        labelStyle: const TextStyle(
                          color: Color(0xFF424242),
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                Container(
                  width: 300,
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    onSaved: (value) => pseudo = value,
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF909090)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF202020)),
                        ),
                        labelText: 'Pseudo',
                        labelStyle: const TextStyle(
                          color: Color(0xFF424242),
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                Container(
                  width: 300,
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    onSaved: (value) => email = value,
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF909090)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF202020)),
                        ),
                        labelText: 'E-mail',
                        labelStyle: const TextStyle(
                          color: Color(0xFF424242),
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                // Input_File(text: "Ajouter une photo"),
                Container(
                  width: 300,
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    onSaved: (value) => password = value,
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF909090)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF202020)),
                        ),
                        labelText: 'Mot de passe',
                        labelStyle: const TextStyle(
                          color: Color(0xFF424242),
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                Container(
                  width: 300,
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    onSaved: (value) => verifPassword = value,
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF909090)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF202020)),
                        ),
                        labelText: 'Vérification du mot de passe',
                        labelStyle: const TextStyle(
                          color: Color(0xFF424242),
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),

                // submit_data(text: "Créer mon compte"),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    child: Text(
                      'Créer mon compte',
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF4202020),
                        decoration: TextDecoration.none,
                        fontSize: 14.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        primary: Colors.white,
                        side: BorderSide(
                            color: Color(0xFF202020),
                            width: 1.0,
                            style: BorderStyle.solid),
                        elevation: 0,
                        shadowColor: Color(0xFFFFFFFF)),
                    onPressed: submitForm,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
