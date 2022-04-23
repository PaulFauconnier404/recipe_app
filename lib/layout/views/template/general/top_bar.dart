import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class Top_Bar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            textDirection: TextDirection.ltr,

            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                width: 50.0,
                height: 50.0,
                decoration:BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    image: AssetImage('image/icons/user.png'),
                    fit: BoxFit.contain,
                  ),
                )
              ),
               SizedBox(
                width: 200,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:const Color(0xFF959595),
                    ),
                    width: 40,
                    height: 3,
                  ),
                  Container(
                    height: 7,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:const Color(0xFF959595),
                      ),
                      width: 30,
                      height: 3,
                    ),
                  ),
                  Container(
                    height: 7,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:const Color(0xFF959595),
                    ),
                    width: 40,
                    height: 3,
                  )
                ],
              ),
              SizedBox(
                width: 20,
              ),
                  
            ],
          ),
        ]
      )
    );
  } 
}