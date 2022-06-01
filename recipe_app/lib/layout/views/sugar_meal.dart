import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/model/recipe_provider.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:provider/provider.dart';

class Sugar_Meal extends StatefulWidget {
  static String routeName = '/sugar-meal';
  

  const Sugar_Meal({Key? key}) : super(key: key);
  
  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Sugar_Meal_State createState() {
      return _Sugar_Meal_State();
  } 
}


class _Sugar_Meal_State extends State<Sugar_Meal> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  


  @override
  Widget build(BuildContext context) {
    final SugarData userData = ModalRoute.of(context)!.settings.arguments as SugarData;
    Provider.of<RecipeProvider>(context).fetchData();
    List<Recipe> recipes = Provider.of<RecipeProvider>(context).recipes;


    return Scaffold(  
      key: _scaffoldKey,
      drawer: Drawer_Implement(email: userData.email,),
      body: Container(
        decoration: BoxDecoration(
          color:const Color(0xFFF5F5F5),
        ),
        child: Column(
            children: [
              
              Top_Bar(scaffoldKey: _scaffoldKey, email : userData.email),
              Second_App_Title(text1:"Les plats ", text2:"sucrés"),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 70, 20, 30),
                height:700,

              child: ListView.builder(
                itemBuilder: (context, i) {
                  if(recipes[i].category == 'sugar'){
                    return Card_View(
                      id: recipes[i].id,
                      title: recipes[i].name as String,
                      text: recipes[i].description as String,
                      image: recipes[i].picture as String,
                      time: recipes[i].time as String,
                      difficulty: recipes[i].difficulty as String,
                      stars: recipes[i].note as List<dynamic>,
                      ingredient: recipes[i].ingredients as List<dynamic>,
                      sideP: false as bool,
                      email: userData.email,
                      );
                  }else{
                    return SizedBox(width: 0, height: 0,);
                  }
                  
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

class SugarData {
  final String email;

  SugarData({required this.email});
}