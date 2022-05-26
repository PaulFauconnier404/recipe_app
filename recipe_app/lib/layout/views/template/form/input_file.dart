import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_app/layout/all_layout.dart';

class Input_File extends StatelessWidget {
  final String text;

  Input_File({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('image/icons/default-picture.png'),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(70), 
            ),                   
          ),
          Submit_Button(text: text)

        ]
      ),

    );
  } 
}