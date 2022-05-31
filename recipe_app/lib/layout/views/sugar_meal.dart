import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';



class Sugar_Meal extends StatefulWidget {
  static String routeName = '/sugar-meal';
  

  const Sugar_Meal({Key? key}) : super(key: key);
  
  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Sugar_Meal_State createState() {
      return _Sugar_Meal_State();
  } 
}


class _Sugar_Meal_State extends State<Sugar_Meal> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  


  @override
  Widget build(BuildContext context) {
    final SugarData userData = ModalRoute.of(context)!.settings.arguments as SugarData;

    return Scaffold(  
      key: _scaffoldKey,
      drawer: Drawer_Implement(),
      body: Container(
        decoration: BoxDecoration(
          color:const Color(0xFFF5F5F5),
        ),
        child: Column(
            children: [
              
              Top_Bar(scaffoldKey: _scaffoldKey, email : userData.email),
              Second_App_Title(text1:"Les plats ", text2:"sucrés"),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 70, 20, 30),
                height:900,

              //   child:  ListView.builder(
                  

              //   itemBuilder: (context, i) {
              //       return Card_View(
              //         title: cards[i]['title'],
              //         text: cards[i]['text'],
              //         image: cards[i]['image'],
              //         time: cards[i]['time'],
              //         difficulty: cards[i]['difficulty'],
              //         stars: cards[i]['stars'],
              //         sideP: cards[i]['side']
              //       ); 
              //     },
              //   itemCount: cards.length,  
                
              // ),
              
              ),
            ],
        ),
        

      ), 
    ); 
  }
}

class SugarData {
  final String email;

  SugarData({required this.email});
}