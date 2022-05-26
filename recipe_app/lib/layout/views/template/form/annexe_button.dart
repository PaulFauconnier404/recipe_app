
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Annexe_Button extends StatelessWidget {
  final String text;
  final String path;
  final size;

  Annexe_Button({
    required this.text,
    required this.size,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:20),

       child: TextButton(
          onPressed: () {
            _navigateAndDisplaySelection(context);
          },
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              color: Color(0xFF707070),
              fontSize: size,
              fontWeight: FontWeight.w400,
            ),
          ),
      ),
    );
  } 
  
  _navigateAndDisplaySelection(BuildContext context) async {
    final choix = await Navigator.pushNamed(
      context,
      path,
     
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$choix"),
      duration: Duration(seconds: 5),
    ));
  }

}