import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class Drink extends StatefulWidget {
  static String routeName = '/drinks';

  const Drink({Key? key}) : super(key: key);

  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Drink_State createState() {
    return _Drink_State();
  }
}

class _Drink_State extends State<Drink> {
  


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    final DrinkData userData = ModalRoute.of(context)!.settings.arguments as DrinkData;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer_Implement(),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
        ),
        child: Column(
          children: [
            Top_Bar(scaffoldKey: _scaffoldKey, email : userData.email),
            Second_App_Title(text1: "Les ", text2: "boissons"),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 70, 20, 30),
              height: 900,
              // child: ListView.builder(
              //   itemBuilder: (context, i) {
              //     return Card_View(
              //         title: cards[i]['title'],
              //         text: cards[i]['text'],
              //         image: cards[i]['image'],
              //         time: cards[i]['time'],
              //         difficulty: cards[i]['difficulty'],
              //         stars: cards[i]['stars'],
              //         sideP: cards[i]['side']);
              //   },
              //   itemCount: cards.length,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrinkData {
  final String email;

  DrinkData({required this.email});
}