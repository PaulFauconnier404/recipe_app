import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class Input_Text extends StatelessWidget {
  final String text;

  Input_Text({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 300,
            padding: const EdgeInsets.only(top: 30),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(      
                  borderSide: BorderSide(color: Color(0xFF909090)),   
                ),  
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF202020)),
                ),
                labelText: text,
                labelStyle: const TextStyle(
                    color: Color(0xFF424242),
                    fontWeight: FontWeight.w500,
                )
              ),
            ),
          );
  } 
}