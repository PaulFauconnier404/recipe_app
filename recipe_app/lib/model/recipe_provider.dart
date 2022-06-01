import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:collection'; // nouveaux type de listes comme UnmodifiableListView
import 'dart:convert'; // pour decoder la réponse http

import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/layout/views/sugar_meal.dart' as data;

// Commandes utiles :
// Lancer le serveur node (attendre le message "connexion ok !")
// backend> npm start

class RecipeProvider with ChangeNotifier {
  final String host = 'http://localhost:3000';
  List<Recipe> _recipes = [];
  List<Recipe> _oneRecipe = [];
  //List<Recipe> _recipes =new List<Recipe>();

  // Getter pour l'accès en lecture de l'ensemble des profiles
  // Pas de modificiation possible grâce au type UnmodifiableListView
  UnmodifiableListView<Recipe> get recipes => UnmodifiableListView(_recipes);
  UnmodifiableListView<Recipe> get oneRecipe => UnmodifiableListView(_oneRecipe);

  // Récupérer les données dans la base de données
  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/recipes'));
      if (response.statusCode == 200) {
        _recipes = (json.decode(response.body) as List)
            .map((recipeJson) => Recipe.fromJson(recipeJson))
            .toList();
       

        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }


  // Récupérer un seul user
  Future<void> selectOne(id) async {

      http.Response response = await http.get(Uri.parse('$host/api/recipes/'+id));
      if (response.statusCode == 200) {
        print(oneRecipe);
        Map<String, dynamic> map = jsonDecode(response.body);
        Recipe recipe = Recipe.fromJson(map);
        _oneRecipe = [];
        _oneRecipe.add(recipe);
        notifyListeners();
      }
      return;
    
  }


  // Ajouter un profile dans la base de données
  Future<void> addRecipe(Recipe newRecipe) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/recipes'),
        body: json.encode(newRecipe.toJson()),
        headers: {'Content-type': 'application/json'},
      );
      if (response.statusCode == 200) {
        _recipes.add(
          Recipe.fromJson(
            json.decode(response.body),
          ),
        );
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }


   // Ajouter un profile dans la base de données
  Future<void> updateRecipe(List<dynamic> newRecipe, id) async {
    try {
      print(newRecipe);
    print( " ---- "+ id);


      http.Response response = await http.patch(
        Uri.parse('$host/api/recipes/'+id),
        body: json.encode({"note" : newRecipe}),
        headers: {'Content-type': 'application/json'},
      );
       if (response.statusCode == 200) {
         _oneRecipe = [];

        _oneRecipe.add(
          Recipe.fromJson(
            json.decode(response.body),
          ),
        );
        notifyListeners();

      }
    } catch (e) {
        print(e);

      rethrow;
    }
  }


}