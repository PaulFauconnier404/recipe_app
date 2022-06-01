import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/layout/all_layout.dart';

class Top_View_Dev_Recipe extends StatelessWidget {
  final String url;
  final String email;
  final returnRoute;

  Top_View_Dev_Recipe({
    required this.url,
    required this.email,
    required this.returnRoute,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(
      clipBehavior: Clip.none, 
      children: [
        InkWell(
          onTap: () {
            _navigateAndDisplaySelection(context);
          },
          child:Positioned(
              left: 0.0,
              top: 0.0,
              child: Container(
                width: 70.0,
                height: 30.0,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFC2C2),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(200.0),
                    topLeft: Radius.circular(50.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage('image/icons/left-arrow.png'),
                  ),
                ),
              ),
            ),
        ),
        Positioned(
          left: 95.0,
          top: -90.0,
          child: Container(
            width: 180.0,
            height: 180.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(url),
              ),
            ),
          ),
        ),
        Container(
          width: 350.0,
          height: 90.0,
        ),
      ],
    );
  }

   _navigateAndDisplaySelection(BuildContext context) async {
    var test;
    String urlLink ="";

    switch (returnRoute) {
      case LoginData:
        urlLink= Salt_Meal.routeName;
        test = LoginData(
          email: email as String,
        );
        break;
     case SugarData:

        urlLink= Sugar_Meal.routeName;
        test = SugarData(
          email: email as String,
        );

        break;
      case DrinkData:
        urlLink= Drink.routeName;
        test = DrinkData(
          email: email as String,
        );
        break;      
    }

    final choix = await Navigator.pushNamed(
      context,
      urlLink,
      arguments: test
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$choix"),
      duration: Duration(seconds: 5),
    ));
  }
}
