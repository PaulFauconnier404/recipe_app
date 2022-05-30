import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/layout/all_layout.dart';

class Card_View extends StatelessWidget {
  final String title;
  final String text;
  final String image;
  final String time;
  final String difficulty;
  final String stars;
  final bool sideP;

  Card_View({
    required this.title,
    required this.text,
    required this.image,
    required this.time,
    required this.difficulty,
    required this.stars,
    required this.sideP,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 250,
      clipBehavior: Clip.none,
      padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
      child: Card(
        clipBehavior: Clip.none,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: sideP ? -50.0 : null,
              right: sideP ? null : -50.0,
              bottom: -50.0,
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              right: sideP ? 0.0 : null,
              left: sideP ? null : 0.0,
              bottom: 0.0,
              child: Container(
                width: 70.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFC2C2),
                  borderRadius: sideP
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(200.0),
                          bottomRight: Radius.circular(15.0))
                      : const BorderRadius.only(
                          topRight: Radius.circular(200.0),
                          bottomLeft: Radius.circular(15.0)),
                  image: DecorationImage(
                    image: AssetImage('image/icons/right-arrow.PNG'),
                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(10, 20, 30, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.fredokaOne(
                        color: Color(0xFF404040),
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(
                      padding: sideP
                          ? EdgeInsets.fromLTRB(90, 15, 0, 0)
                          : EdgeInsets.fromLTRB(30, 15, 80, 0),
                      child: Text(
                        text,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.montserrat(
                          color: Color(0xFF404040),
                          fontWeight: FontWeight.w200,
                          decoration: TextDecoration.none,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Details_Value_Meal(
                        time: time, difficulty: difficulty, stars: stars)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
