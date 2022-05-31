import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Salt_Meal extends StatefulWidget {
  static String routeName = '/salt-meal';

  const Salt_Meal({Key? key}) : super(key: key);

  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Salt_Meal_State createState() {
    return _Salt_Meal_State();
  }
}

class _Salt_Meal_State extends State<Salt_Meal> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List cards = [
    {
      'title': 'Pizza aux champignons',
      'text':
          'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise',
      'image': 'image/recipe/pizza.png',
      'time': '10min',
      'difficulty': 'Facile',
      'stars': '4,5/5',
      'side': true
    },
    {
      'title': 'Pizza aux champignons',
      'text':
          'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise',
      'image': 'image/recipe/pizza.png',
      'time': '10min',
      'difficulty': 'Facile',
      'stars': '4,5/5',
      'side': false
    },
    {
      'title': 'Pizza aux champignons',
      'text':
          'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise',
      'image': 'image/recipe/pizza.png',
      'time': '10min',
      'difficulty': 'Facile',
      'stars': '4,5/5',
      'side': true
    },
    {
      'title': 'Pizza aux champignons',
      'text':
          'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise',
      'image': 'image/recipe/pizza.png',
      'time': '10min',
      'difficulty': 'Facile',
      'stars': '4,5/5',
      'side': false
    },
  ];

  void press(card) {
    int index = cards.indexOf(card);
    setState(() {
      cards[index]['press'] = !cards[index]['press'];
    });
  }
  @override
  Widget build(BuildContext context) {
    final LoginData userData = ModalRoute.of(context)!.settings.arguments as LoginData;

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
            Second_App_Title(text1: "Les plats ", text2: "salés"),
            Text("Bienvenue ${userData.email}"),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 70, 20, 30),
              height: 900,
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return Card_View(
                      title: cards[i]['title'],
                      text: cards[i]['text'],
                      image: cards[i]['image'],
                      time: cards[i]['time'],
                      difficulty: cards[i]['difficulty'],
                      stars: cards[i]['stars'],
                      sideP: cards[i]['side']);
                },
                itemCount: cards.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}

class LoginData {
  final String email;

  LoginData({required this.email});
}