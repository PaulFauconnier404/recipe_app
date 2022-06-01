import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/model/user_provider.dart';
import 'package:recipe_app/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/model/recipe_provider.dart';
import 'package:recipe_app/model/recipe_model.dart';

class Favorites extends StatefulWidget {
  static String routeName = '/my-favorites';

  const Favorites({Key? key}) : super(key: key);

  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Favorites_State createState() {
    return _Favorites_State();
  }
}

class _Favorites_State extends State<Favorites> {
  bool view = true;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    final FavoritesData userData = ModalRoute.of(context)!.settings.arguments as FavoritesData;

    Provider.of<UserProvider>(context).selectByEmail(userData.email);
    List<User> users = Provider.of<UserProvider>(context).users;

    List<dynamic> favRecipe = users[0].favrecipe as List<dynamic>;


    if(view == true){
      Provider.of<RecipeProvider>(context).selectFav(favRecipe);
      view = false;
    }
    List<dynamic> recipeFav = Provider.of<RecipeProvider>(context).favRecipe;

                print(recipeFav[0].category);

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer_Implement(
        email: userData.email,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
        ),
        // ListView.separated : Construction des widgets visibles + s ́eparateur
        child: Column(
          children: [
            Top_Bar(scaffoldKey: _scaffoldKey, email: userData.email),
            Second_App_Title(text1: "Mes ", text2: "favoris"),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 70, 20, 30),
              height: 700,
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return Card_View(
                    id: recipeFav[i].id,
                    title: recipeFav[i].name as String,
                    text: recipeFav[i].description as String,
                    image: recipeFav[i].picture as String,
                    time: recipeFav[i].time as String,
                    difficulty: recipeFav[i].difficulty as String,
                    stars: recipeFav[i].note as List<dynamic>,
                    ingredient: recipeFav[i].ingredients as List<dynamic>,
                    sideP: false as bool,

                    email: userData.email,
                    returnRoute: FavoritesData,
                  );
                },
                itemCount: recipeFav.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesData {
  final String email;

  FavoritesData({required this.email});
}
