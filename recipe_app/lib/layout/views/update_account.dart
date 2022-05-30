import 'package:recipe_app/layout/all_layout.dart';
import 'package:recipe_app/model/user_provider.dart';
import 'package:recipe_app/model/user_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class Update_Account extends StatefulWidget {
  static String routeName = '/update-account';

  const Update_Account({Key? key}) : super(key: key);
  
  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Update_Account_State createState() {
      return _Update_Account_State();
  } 
}


class _Update_Account_State extends State<Update_Account> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final UserProvider userProvider = UserProvider();

  @override
  void initState() {
    super.initState();
    userProvider.fetchData();
  }


  @override
  Widget build(BuildContext context) {
    // List<User> profiles = Provider.of<UserProvider>(context).profiles;
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


              // Second_App_Title(text1:"Modifier un ", text2:"compte"),
              // Input_Text(text: "Nom", valueToUp: "name"),
              // Input_Text(text: "Prénom", valueToUp: "firstname"),
              // Input_Text(text: "Pseudo", valueToUp: "pseudo"),
              // Input_Text(text: "E-mail", valueToUp: "email"),
              // Input_File(text: "Ajouter une photo"),
              // Input_Text(text: "Mot de passe", valueToUp: "password"),
              // Input_Text(text: "Vérification mot de passe", valueToUp: "password"),
              // Submit_Button(text: "Modifier mon compte"),
            ],
        ),
        ),
    );
  }
}