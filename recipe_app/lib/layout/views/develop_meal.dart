import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/model/recipe_provider.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:provider/provider.dart';

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
  bool view = true;
  bool _starsUp = false;

  @override
  Widget build(BuildContext context) {
    final MealData userData = ModalRoute.of(context)!.settings.arguments as MealData;

    if(view == true){
      Provider.of<RecipeProvider>(context).selectOne(userData.id);
      view = false;
    }
    List<Recipe> recipes = Provider.of<RecipeProvider>(context).oneRecipe;
    List<dynamic> note = recipes[0].note;

    void addNote(noteToAdd) async{
      note.add(noteToAdd);
      await Provider.of<RecipeProvider>(
            context,
            listen: false,
          ).updateRecipe(note, recipes[0].id);
    }

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
                    Top_View_Dev_Recipe(url: recipes[0].picture, email: userData.email, returnRoute: userData.returnRoute ),
                    //Développement de la recette
                    Recipe_Dev_Title(
                        title: recipes[0].name,
                        description:
                            recipes[0].description,
                        time: recipes[0].time,
                        difficulty: recipes[0].difficulty,
                        stars: recipes[0].note as List<dynamic>),
                    //Grille des ingrédients
                    Ingredients_Grid(ingerdients : recipes[0].ingredients as List<dynamic>),
                    //Star notation
                    Container(
                          width: 350,
                          child: Column(
                            children: [
                              Container(
                                width: 350,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'Ingrédients :',
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF202020),
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 350,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: IconButton(
                                        icon: const Icon(Icons.star_border),
                                        tooltip: '1',
                                        onPressed: () {addNote(1);},
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: IconButton(
                                        icon: const Icon(Icons.star_border),
                                        tooltip: '2',
                                        onPressed: () {addNote(2);},
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: IconButton(
                                        icon: const Icon(Icons.star_border),
                                        tooltip: '3',
                                        onPressed: () {addNote(3);},
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: IconButton(
                                        icon: const Icon(Icons.star_border),
                                        tooltip: '4',
                                        onPressed: () {addNote(4);},
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: IconButton(
                                        icon: Icon(
                                          _starsUp
                                          ? Icons.star_border
                                          : Icons.star

                                          ),
                                        tooltip: '5',
                                        onPressed: () {
                                          addNote(5);

                                          setState(() {
                                          _starsUp = !_starsUp;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        )                  
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
  final returnRoute;

  MealData({required this.email, required this.id, required this.returnRoute});
}