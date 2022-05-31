import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  static String routeName = '/my-favorites';

  const Favorites({Key? key}) : super(key: key);

  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Favorites_State createState() {
    return _Favorites_State();
  }
}

class _Favorites_State extends State<Favorites> {
  


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    final FavoritesData userData = ModalRoute.of(context)!.settings.arguments as FavoritesData;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer_Implement(),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
        ),
        // ListView.separated : Construction des widgets visibles + s ́eparateur
        child: Column(
          children: [
            Top_Bar(scaffoldKey: _scaffoldKey, email : userData.email),
            Second_App_Title(text1: "Mes ", text2: "favoris"),
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

class FavoritesData {
  final String email;

  FavoritesData({required this.email});
}
