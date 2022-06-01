import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Recipe_Dev_Title extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String difficulty;
  final List<dynamic> stars;

  Recipe_Dev_Title({
    required this.title,
    required this.description,
    required this.time,
    required this.difficulty,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
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
                        time: time, difficulty: difficulty, stars: '2.5')
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border),
                    tooltip: 'Add to favorites',
                    onPressed: () {},
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
