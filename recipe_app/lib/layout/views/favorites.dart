import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/model/recipe_provider.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  static String routeName = '/my-favorites';

  const Favorites({Key? key}) : super(key: key);

  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Favorites_State createState() => _Favorites_State();
}

class _Favorites_State extends State<Favorites> {
  @override
  void initState() {
    super.initState();
    RecipeProvider().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    List<Recipe> recipes = Provider.of<RecipeProvider>(context).recipe;

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
            Top_Bar(scaffoldKey: _scaffoldKey),
            Second_App_Title(text1: "Mes ", text2: "favoris"),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 70, 20, 30),
              height: 900,
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return Card_View(
                      id: recipes[i].id,
                      title: recipes[i].name,
                      text: recipes[i].description,
                      image: recipes[i].picture,
                      time: recipes[i].time,
                      difficulty: recipes[i].difficulty,
                      stars: recipes[i].note,
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
