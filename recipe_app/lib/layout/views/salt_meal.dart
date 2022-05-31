import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/model/recipe_provider.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:provider/provider.dart';

class Salt_Meal extends StatefulWidget {
  static String routeName = '/salt-meal';

  const Salt_Meal({Key? key}) : super(key: key);

  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Salt_Meal_State createState() {
    return _Salt_Meal_State();
  }
}

class _Salt_Meal_State extends State<Salt_Meal> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    final LoginData userData = ModalRoute.of(context)!.settings.arguments as LoginData;

    Provider.of<RecipeProvider>(context).fetchData();
    List<Recipe> recipes = Provider.of<RecipeProvider>(context).recipes;

print(recipes[0].name);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer_Implement(),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
        ),
        // ListView.separated : Construction des widgets visibles + s ́eparateur
        child: Column(
          children: [
            Top_Bar(scaffoldKey: _scaffoldKey, email : userData.email),
            Second_App_Title(text1: "Les plats ", text2: "salés"),
            Text("Bienvenue ${userData.email}"),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 70, 20, 30),
              height: 900,
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return Card_View(
                      id: recipes[i].id as String,
                      title: recipes[i].name as String,
                      text: recipes[i].description as String,
                      image: recipes[i].picture as String,
                      time: recipes[i].time as String,
                      difficulty: recipes[i].difficulty as String,
                      stars: recipes[i].note[0] as String,
                      sideP: false as bool);
                },
                itemCount: recipes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}

class LoginData {
  final String email;

  LoginData({required this.email});
}