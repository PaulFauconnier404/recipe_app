import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Submit_Button extends StatelessWidget {
  final String text;

  Submit_Button({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: ElevatedButton(
        child: Text(
          text,
          textDirection: TextDirection.ltr,
          style: GoogleFonts.montserrat(
            color: Color(0xFF4202020),
            decoration: TextDecoration.none,
            fontSize: 14.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
          primary: Colors.white,
          side: BorderSide(color: Color(0xFF202020), width: 1.0, style: BorderStyle.solid), 
          elevation: 0,
          shadowColor: Color(0xFFFFFFFF)
        ),
        onPressed: () {
          _navigateAndDisplaySelection(context);
        },
      )
    );
  } 

   _navigateAndDisplaySelection(BuildContext context) async {
    final choix = await Navigator.pushNamed(
      context,
      '/sugar-meal',
     
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$choix"),
      duration: Duration(seconds: 5),
    ));
  }
}