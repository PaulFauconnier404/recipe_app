import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/model/recipe_provider.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:provider/provider.dart';

class Drink extends StatefulWidget {
  static String routeName = '/drinks';

  const Drink({Key? key}) : super(key: key);

  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Drink_State createState() {
    return _Drink_State();
  }
}

class _Drink_State extends State<Drink> {
  


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    final DrinkData userData = ModalRoute.of(context)!.settings.arguments as DrinkData;

    Provider.of<RecipeProvider>(context).fetchData();
    List<Recipe> recipeDrink = Provider.of<RecipeProvider>(context).recipes;  
    
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer_Implement(email: userData.email,),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
        ),
        child: Column(
          children: [
            Top_Bar(scaffoldKey: _scaffoldKey, email : userData.email),
            Second_App_Title(text1: "Les ", text2: "boissons"),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 70, 20, 30),
              height: 700,
              child: ListView.builder(
                itemBuilder: (context, i) {
                  if(recipeDrink[i].category == 'drinks'){

                    return Card_View(
                      id: recipeDrink[i].id,
                      title: recipeDrink[i].name as String,
                      text: recipeDrink[i].description as String,
                      image: recipeDrink[i].picture as String,
                      time: recipeDrink[i].time as String,
                      difficulty: recipeDrink[i].difficulty as String,
                      stars: recipeDrink[i].note as List<dynamic>,
                      ingredient: recipeDrink[i].ingredients as List<dynamic>,
                      sideP: false as bool,

                      email: userData.email,
                      returnRoute: DrinkData,

                      );
                  }else{
                    return SizedBox(width: 0, height: 0,);
                  }
                  
                },
                itemCount: recipeDrink.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrinkData {
  final String email;

  DrinkData({required this.email});
}