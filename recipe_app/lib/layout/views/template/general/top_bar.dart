import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class Top_Bar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

    Top_Bar({
      required this.scaffoldKey,
    });

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
              InkWell(
                onTap: () {
                  _navigateAndDisplaySelection(context);
                },
                child: Container(
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
              ),
              SizedBox(
                width: 200,
              ),
              
              Container(
              child: IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () => scaffoldKey.currentState!.openDrawer()
                          ),
              ),
              SizedBox(
                width: 20,
              ),
                  
            ],
          ),
        ]
      ),
      );
  } 

  _navigateAndDisplaySelection(BuildContext context) async {
    final choix = await Navigator.pushNamed(
      context,
      '/update-account',
     
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$choix"),
      duration: Duration(seconds: 5),
    ));
  }
}