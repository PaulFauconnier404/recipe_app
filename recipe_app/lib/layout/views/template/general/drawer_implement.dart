import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/layout/all_layout.dart';

class Drawer_Implement extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children:  <Widget>[
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      '📖',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 50.0,
                      ),    
                    ),
                    Text(
                      'DarterKing',
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.ebGaramond(
                        color: Color(0xFF404040),
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        fontSize: 35.0,
                      ),  
                    ),
                    Container(
                      height: 3.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFF867CD6),
                            Color(0xFF86D0FF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                    )
                  ],
                ),
                
                SizedBox(height: 50,),
                Row_Icons_Text_Drawer(text: 'Accueil', icon: Icons.home, url: "/salt-meal" ),
                Row_Icons_Text_Drawer(text: 'Plats Salés', icon: Icons.local_pizza, url: "/salt-meal" ),
                Row_Icons_Text_Drawer(text: 'Plats Sucrés', icon: Icons.cake, url: "/sugar-meal" ),
                Row_Icons_Text_Drawer(text: 'Boissons', icon: Icons.local_bar, url: "/drinks" ),
                Row_Icons_Text_Drawer(text: 'Mes Favoris', icon: Icons.favorite, url: "/my-favorites" ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  child:Container(
                    width: 80,
                    height: 1,
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Color(0xFF404040)
                    ),
                  ),
                ),
                Row_Icons_Text_Drawer(text: 'Mon Compte', icon: Icons.person, url: "/update-account"  ),
                Row_Icons_Text_Drawer(text: 'Déconnexion', icon: Icons.logout, url: "/"  ),
              ],
            ),
          );
  } 
}