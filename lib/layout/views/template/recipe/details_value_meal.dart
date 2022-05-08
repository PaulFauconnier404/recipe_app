import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Details_Value_Meal extends StatelessWidget {
  final String time;
  final String difficulty;
  final String stars;

  Details_Value_Meal({
    required this.time,
    required this.difficulty,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 30.0,
                height: 20.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/icons/timer.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                time,
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
          Text(
            difficulty,
            textDirection: TextDirection.ltr,
            style: GoogleFonts.montserrat(
              color: Color(0xFF404040),
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
              fontSize: 12.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 30.0,
                height: 20.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/icons/star.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                stars,
                textDirection: TextDirection.ltr,
                style: GoogleFonts.montserrat(
                  color: Color(0xFF404040),
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.none,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
