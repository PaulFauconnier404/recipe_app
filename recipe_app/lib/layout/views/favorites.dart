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
    return Scaffold();
  }
}