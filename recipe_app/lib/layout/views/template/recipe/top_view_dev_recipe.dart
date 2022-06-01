import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class Top_View_Dev_Recipe extends StatelessWidget {
  final String url;

  Top_View_Dev_Recipe({
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, 
      children: [
        Positioned(
          left: 0.0,
          top: 0.0,
          child: Container(
            width: 70.0,
            height: 30.0,
            decoration: const BoxDecoration(
              color: Color(0xFFFFC2C2),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(200.0),
                topLeft: Radius.circular(50.0),
              ),
              image: DecorationImage(
                image: AssetImage('image/icons/left-arrow.png'),
              ),
            ),
          ),
        ),
        Positioned(
          left: 95.0,
          top: -90.0,
          child: Container(
            width: 180.0,
            height: 180.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(url),
              ),
            ),
          ),
        ),
        Container(
          width: 350.0,
          height: 90.0,
        ),
      ],
    );
  }
}
