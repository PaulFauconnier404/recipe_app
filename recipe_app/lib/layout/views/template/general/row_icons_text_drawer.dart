import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Row_Icons_Text_Drawer extends StatelessWidget {
  final String text;
  final IconData icon;
  final String url;

  Row_Icons_Text_Drawer({
    required this.text,
    required this.icon,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      child : Container(
        width: 200,
        padding: EdgeInsets.fromLTRB(50, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              
              child: Text(
                text,
                textDirection: TextDirection.ltr,
                
                style: GoogleFonts.montserrat(
                  color: Color(0xFF202020),
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                ),      
              ),
            ),
          ]
        ),
      ),
      onTap: () {
        _navigateAndDisplaySelection(context);
      },
    );
  } 

  _navigateAndDisplaySelection(BuildContext context) async {
    final choix = await Navigator.pushNamed(
      context,
      url,
     
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$choix"),
      duration: Duration(seconds: 5),
    ));
  }
}