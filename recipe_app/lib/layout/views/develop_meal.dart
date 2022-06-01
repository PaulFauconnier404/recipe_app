import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Develop_Meal extends StatefulWidget {
  static String routeName = '/develop-meal';

  const Develop_Meal({Key? key}) : super(key: key);

  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Develop_Meal_State createState() {
    return _Develop_Meal_State();
  }
}

class _Develop_Meal_State extends State<Develop_Meal> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final MealData userData = ModalRoute.of(context)!.settings.arguments as MealData;
  print(userData.id +' ----- '+ userData.email);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer_Implement(email: userData.email,),
      body: Container(
          child: Column(
        children: [
          Top_Bar(scaffoldKey: _scaffoldKey, email : userData.email),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
            child: Container(
                width: 350,
                height: 650,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    //En-tete de la card
                    Top_View_Dev_Recipe(url: 'image/recipe/pizza.png'),
                    //Développement de la recette
                    Recipe_Dev_Title(
                        title: "Pizza au champignons",
                        description:
                            "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise   ",
                        time: "10min",
                        difficulty: "Modéré",
                        stars: "4.2/5"),
                    //Grille des ingrédients
                    Ingredients_Grid(),
                    //Star notation
                    Stars_Container()
                  ],
                )),
          )
        ],
      )),
    );
  }
}

class MealData {
  final String email;
  final String id;

  MealData({required this.email, required this.id});
}