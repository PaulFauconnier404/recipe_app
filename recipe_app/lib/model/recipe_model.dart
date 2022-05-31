class Recipe {
  String? id;
  String name;
  String picture;
  String description;
  String time;
  String difficulty;
  String note;
  String ingredients;

  Recipe({
    required this.id,
    required this.name,
    required this.picture,
    required this.description,
    required this.time,
    required this.difficulty,
    required this.note,
    required this.ingredients,
  });

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        picture = json['picture'],
        description = json['description'],
        time = json['time'],
        difficulty = json['difficulty'],
        note = json['note'],
        ingredients = json['ingredients'];

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
        '_id': id,
        'name': name,
        'picture': picture,
        'description': description,
        'time': time,
        'difficulty': difficulty,
        'note': note,
        'ingredients': ingredients,
      };
    } else {
      return {
        'name': name,
        'picture': picture,
        'description': description,
        'time': time,
        'difficulty': difficulty,
        'note': note,
        'ingredients': ingredients,
      };
    }
  }
}
