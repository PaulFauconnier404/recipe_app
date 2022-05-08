import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';



class Create_Account extends StatefulWidget {
  static String routeName = '/create-account';


  const Create_Account({Key? key}) : super(key: key);
  
  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Create_Account_State createState() {
      return _Create_Account_State();
  } 
}


class _Create_Account_State extends State<Create_Account> {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer_Implement(),
      body: Container(
        decoration: BoxDecoration(
          color:const Color(0xFFF5F5F5),
        ),
        child: Column(
            children: [
              
              Top_Bar(scaffoldKey : _scaffoldKey),
              Second_App_Title(text1:"Créer un ", text2:"compte"),
              Input_Text(text: "Nom"),
              Input_Text(text: "Prénom"),
              Input_Text(text: "Pseudo"),
              Input_Text(text: "E-mail"),
              Input_File(text: "Ajouter une photo"),
              Input_Text(text: "Mot de passe"),
              Input_Text(text: "Vérification mot de passe"),
              Submit_Button(text: "Créer mon compte"),
            ],
        ),
      ), 
    );
  }
}