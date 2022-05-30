class User {
  String? id;
  String name;
  String firstname;
  String pseudo;
  String picture;
  String email;
  String password;
  List favRecipe;

  User({
    this.id,
    required this.name,
    required this.firstname,
    required this.pseudo,
    required this.picture,
    required this.email,
    required this.password,
    required this.favRecipe,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        firstname = json['firstname'],
        pseudo = json['pseudo'],
        picture = json['picture'],
        email = json['email'],
        password = json['password'],
        favRecipe = json['favRecipe'];

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
        '_id': id,
        'name': name,
        'firstname': firstname,
        'pseudo': pseudo,
        'picture': picture,
        'email': email,
        'password': password,
        'favRecipe': favRecipe,
      };
    } else {
      return {
        'email': email,
        'password': password,
      };
    }
  }

  String showUser() {
    return "$email\n$password\n\n";
  }
}
