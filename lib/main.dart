import 'package:flutter/material.dart';
import 'package:recipe_app/layout/all_layout.dart';

void main() {
  runApp(MaterialApp(
    title: 'Darter King',
    theme: ThemeData(primarySwatch: Colors.green),
    debugShowCheckedModeBanner: false,
    initialRoute: Login.routeName,
    routes: {
      Login.routeName : (context) => Login(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == Sugar_Meal.routeName) {
          return MaterialPageRoute(builder: (context) {return Sugar_Meal();});
        }else if (settings.name == Salt_Meal.routeName) {
          return MaterialPageRoute(builder: (context) {return Salt_Meal();});
        }else if (settings.name == Drink.routeName) {
          return MaterialPageRoute(builder: (context) {return Drink();});
        }else if (settings.name == Create_Account.routeName) {
          return MaterialPageRoute(builder: (context) {return Create_Account();});
        }else if (settings.name == Develop_Meal.routeName) {
          return MaterialPageRoute(builder: (context) {return Develop_Meal();});
        }else if (settings.name == Favorites.routeName) {
          return MaterialPageRoute(builder: (context) {return Favorites();});
        }else if (settings.name == Login.routeName) {
          return MaterialPageRoute(builder: (context) {return Login();});
        }else if (settings.name == Update_Account.routeName) {
          return MaterialPageRoute(builder: (context) {return Update_Account();});
        }
      },
      onUnknownRoute: (settings) {
      return MaterialPageRoute(builder: (context) => NotFound());
      },
  ),);
  
}
class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Erreur de navigation'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: const Text('404'),
        ),
      );
    }
}
