import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/model/recipe_provider.dart';

//import 'package:http/http.dart' as http;
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class Sugar_Meal extends StatefulWidget {
  static String routeName = '/sugar-meal';

  const Sugar_Meal({Key? key}) : super(key: key);

  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Sugar_Meal_State createState() => _Sugar_Meal_State();
}

///

///
class _Sugar_Meal_State extends State<Sugar_Meal> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<RecipeProvider>(context).fetchData();
    List<Recipe> recipes = Provider.of<RecipeProvider>(context).recipes;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer_Implement(),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
        ),
        child: Column(
          children: [
            Top_Bar(scaffoldKey: _scaffoldKey),
            Second_App_Title(
                text1: recipes[0].description, text2: recipes[0].name),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 70, 20, 30),
              height: 560,
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return Card_View(
                      id: recipes[i].id,
                      title: recipes[i].name,
                      text: recipes[i].description,
                      image: recipes[i].picture,
                      time: recipes[i].time,
                      difficulty: recipes[i].difficulty,
                      stars: recipes[i].note[0],
                      sideP: false);
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
