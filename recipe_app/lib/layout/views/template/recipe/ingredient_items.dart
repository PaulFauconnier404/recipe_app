import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Ingredients_Items extends StatelessWidget {
  final String image;
  final String text;

  Ingredients_Items({
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            text,
            textDirection: TextDirection.ltr,
            style: GoogleFonts.montserrat(
              color: Color(0xFF404040),
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.none,
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
