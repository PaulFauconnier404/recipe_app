import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/model/user_provider.dart';
import 'package:recipe_app/model/user_model.dart';
import 'package:provider/provider.dart';

class Recipe_Dev_Title extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String difficulty;
  final List<dynamic> stars;

  final String email;
  final String recipeId;


  Recipe_Dev_Title({
    required this.title,
    required this.description,
    required this.time,
    required this.difficulty,
    required this.stars,
    
    required this.email,
    required this.recipeId,
  });


  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context).selectByEmail(email);
    List<User> users = Provider.of<UserProvider>(context).users;

    void addFav() async{
      _liked = true;

      List<dynamic> favRecipe = users[0].favrecipe as List<dynamic>;
      favRecipe.add(recipeId);
      print('cc');
       await Provider.of<UserProvider>(
            context,
            listen: false,
          ).updateUserFav(users[0].id, favRecipe);


    }

    return Container(
        width: 350,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Text(
                        title,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.fredokaOne(
                          color: Color(0xFF404040),
                          decoration: TextDecoration.none,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Details_Value_Meal(
                        time: time, difficulty: difficulty, stars: stars)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: Icon(
                      _liked == true
                        ? Icons.favorite
                        : Icons.favorite_border
                    ),
                    tooltip: 'Add to favorites',
                    onPressed: () {
                      addFav();
                    },
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                description,
                textDirection: TextDirection.ltr,
                style: GoogleFonts.montserrat(
                  color: Color(0xFF404040),
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.none,
                  fontSize: 10.0,
                ),
              ),
            ),
            Container(
              width: 200,
              height: 1,
              padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFC2C2),
              ),
            )
          ],
        ));
  }
}
