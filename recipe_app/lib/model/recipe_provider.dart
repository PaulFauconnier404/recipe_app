import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:collection'; // nouveaux type de listes comme UnmodifiableListView
import 'dart:convert'; // pour decoder la réponse http

import 'package:recipe_app/model/recipe_model.dart';

// Commandes utiles :
// Lancer le serveur node (attendre le message "connexion ok !")
// backend> npm start

class RecipeProvider with ChangeNotifier {
  final String host = 'http://localhost:3000';
  List<Recipe> _recipe = [];

  // Getter pour l'accès en lecture de l'ensemble des profils
  // Pas de modificiation possible grâce au type UnmodifiableListView
  UnmodifiableListView<Recipe> get recipe => UnmodifiableListView(_recipe);

  // Récupérer les données dans la base de données
  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/recipe'));
      if (response.statusCode == 200) {
        _recipe = (json.decode(response.body) as List)
            .map((userJson) => User.fromJson(userJson))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  // Ajouter un profil dans la base de données
  Future<void> addUser(User newUser) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/users'),
        body: json.encode(newUser.toJson()),
        headers: {'Content-type': 'application/json'},
      );
      if (response.statusCode == 200) {
        _users.add(
          User.fromJson(
            json.decode(response.body),
          ),
        );
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> logUser(User user) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/users/login'),
        body: json.encode(user.toJson()),
        headers: {'Content-type': 'application/json'},
      );
      Map<String, dynamic> temp = json.decode(response.body);

      if (response.statusCode == 200) {
        return ("200");
      } else {
        return (temp['error']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
