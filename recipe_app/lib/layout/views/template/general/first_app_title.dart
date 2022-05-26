import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class First_App_Title extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.fromLTRB(100, 200, 100, 100),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            '📖',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 70.0,
            ),    
          ),
          Text(
            'DarterKing',
            textDirection: TextDirection.ltr,
            style: GoogleFonts.ebGaramond(
              color: Color(0xFF404040),
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              fontSize: 50.0,
            ),  
          ),
          Container(
            height: 3.0,
            width: 100.0,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF867CD6),
                  Color(0xFF86D0FF),
                ],
              ),
              borderRadius: BorderRadius.circular(20)
            ),
          )
        ],
      ),
    );

  } 
}