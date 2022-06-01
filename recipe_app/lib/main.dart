import 'package:flutter/material.dart';
import 'package:recipe_app/layout/all_layout.dart';
import 'package:recipe_app/model/user_provider.dart';
import 'package:recipe_app/model/recipe_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => RecipeProvider()),
      ],
      
    child:  MaterialApp(

      title: 'Darter King',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      initialRoute: Login.routeName,
      routes: {
        '/': (context) => const Login(),
        Sugar_Meal.routeName: (_) => const Sugar_Meal(),
        Salt_Meal.routeName: (_) => const Salt_Meal(),
        Drink.routeName: (_) => const Drink(),
        Create_Account.routeName: (_) => const Create_Account(),
        Develop_Meal.routeName: (_) => const Develop_Meal(),
        Favorites.routeName: (_) => const Favorites(),
        Login.routeName: (_) => const Login(),
        Update_Account.routeName: (_) => const Update_Account(),

       
        },
        
        onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => NotFound());
        },
    ),
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

class LoginData {
  final String email;

  LoginData({required this.email});
}