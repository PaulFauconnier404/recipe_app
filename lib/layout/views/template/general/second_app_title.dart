import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Second_App_Title extends StatelessWidget {
  // final String text;

  // Second_App_Title({
  //   required this.text,
  // });

  @override
  Widget build(BuildContext context) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children:[
                  Center(
                    child: Text(
                      'DarterKing',
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.ebGaramond(
                        color: Color(0xFF404040),
                        decoration: TextDecoration.none,
                        fontSize: 40.0,
                      ),      
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                   Container(
                    height: 1,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
                   Container(
                    height: 10,
                  ),
                  Center(
                    child: Text.rich(
                      
                      TextSpan(
                        text: 'Les plats ',
                        style: GoogleFonts.montserrat(
                          color: Color(0xFF404040),
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w300,
                          fontSize: 10.0,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'salés',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          )
                        ]
                      ),
                    ),
                  )
                ]
              );
  } 
}