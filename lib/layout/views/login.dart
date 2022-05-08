import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String routeName = '/';
  
  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Login_State createState() {
      return _Login_State();
  } 
}


class _Login_State extends State<Login> {
  

  @override
  Widget build(BuildContext context) {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer_Implement(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          First_App_Title(),
          Input_Text(text: "Pseudo"),
          Input_Text(text: "Mot de passe"),
          Submit_Button(text: "Connexion"),
          Annexe_Button(text: "Créer un compte ?", size: 14),
          Annexe_Button(text: "Mot de passe oublié ?", size: 12),

        ]
      ),

    );
  }


  


}