import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/layout/all_layout.dart';

class Ingredients_Grid extends StatelessWidget {
  final List ingerdients;

  Ingredients_Grid({
    required this.ingerdients,
  });

 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
        Container(
            width: 350,
            height: 200,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0),
              itemCount: ingerdients.length,
              itemBuilder: (context, i) {
                return Ingredients_Items(
                  image: 'image/ingredients/'+ingerdients[i]+'.png',
                  text: ingerdients[i],
                );
              },
            )),
        Container(
          width: 200,
          height: 1,
          padding: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Color(0xFFFFC2C2),
          ),
        )
      ],
    );
    ;
  }
}
