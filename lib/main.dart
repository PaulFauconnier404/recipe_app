import 'package:flutter/material.dart';
import 'package:recipe_app/layout/all_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Darter King',
      theme: ThemeData(primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false,
      
      home: Salt_Meal(),
     

     
    );
  }
}
