import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';
import 'profile_model.dart';

class UserProvider with ChangeNotifier {
  final String host = 'http://localhost:3000';
  List<Profile> _profiles = [];
  UnmodifiableListView<Profile> get profiles => UnmodifiableListView(_profiles);
// R ́ecup ́erer les donn ́ees dans la base de donn ́ees
  void fetchData() async {
    try {
          http.Response response = await http.get(Uri.parse('$host/api/user'));
          if (response.statusCode == 200) {
            _profiles = (json.decode(response.body) as List)
                .map((profileJson) => Profile.fromJson(profileJson))
                .toList();
            notifyListeners();
          }
    } catch (e) {
      rethrow; 
    }
  }
// Ajouter un profile dans la base de donn ́ees
  Future<void> addProfile(Profile newProfile) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/user'),
        body: json.encode(newProfile.toJson()),
        headers: {'Content-type': 'application/json'},
          );
        if (response.statusCode == 200) {
          notifyListeners();
      }
    } catch (e) {
      rethrow; }
  }
}