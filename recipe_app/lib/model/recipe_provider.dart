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
  //List<Recipe> _recipes =new List<Recipe>();

  // Getter pour l'accès en lecture de l'ensemble des profiles
  // Pas de modificiation possible grâce au type UnmodifiableListView
  UnmodifiableListView<Recipe> get recipes => UnmodifiableListView(_recipes);

  // Récupérer les données dans la base de données
  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/recipes'));
      if (response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(response.body);
        Recipe recipe = Recipe.fromJson(map);
        _recipes.add(recipe);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
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
}
