class User {
  String? id;
  String name;
  String firstname;
  String pseudo;
  String birthdate;
  String email;
  String password;
  List<dynamic>? favrecipe;

  User({
    this.id,
    required this.name,
    required this.firstname,
    required this.pseudo,
    required this.birthdate,
    required this.email,
    required this.password,
    this.favrecipe,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        firstname = json['firstname'],
        pseudo = json['pseudo'],
        birthdate = json['birthdate'],
        email = json['email'],
        password = json['password'],
        favrecipe = json['favRecipe'];

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
        '_id': id,
        'name': name,
        'firstname': firstname,
        'pseudo': pseudo,
        'birthdate' : birthdate,
        'email': email,
        'password': password,
        'favrecipe': favrecipe,
      };
    } else {
      return {
        'name': name,
        'firstname': firstname,
        'pseudo': pseudo,
        'birthdate' : birthdate,
        'email': email,
        'password': password,
        'favrecipe': favrecipe,
      };
    }
  }

}
