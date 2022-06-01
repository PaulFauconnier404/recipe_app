import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:recipe_app/model/user_model.dart';
import 'package:recipe_app/model/user_provider.dart';

import 'package:intl/intl.dart';

class Create_Account extends StatefulWidget {
  static String routeName = '/create-account';


  const Create_Account({Key? key}) : super(key: key);
  
  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Create_Account_State createState() {
      return _Create_Account_State();
  } 
}


class _Create_Account_State extends State<Create_Account> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  

  late User newUser;

  String? name;
  String? firstname;
  String? pseudo;
  String? email;
  String? password;
  List? favrecipe = [];
  DateTime? birthdate;
    
  @override
  void initState() {
    newUser = User(
      name: " ",
      firstname: " ",
      pseudo: " ",
      birthdate : '',
      email: " ",
      password: " ",
      favrecipe : []
    );
    super.initState();
  }

  Future<void> submitForm() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        await Provider.of<UserProvider>(
          context,
          listen: false,
        ).addUser(newUser);

        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()

          ..showSnackBar(
            SnackBar(
              content: Text("Votre profil a été créé ${newUser.firstname} !"),
            ), 
          );

          Navigator.of(context).pushNamed("/");

        
     }
    } catch (e) {
      print("error !");
    }
  }

  void setDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: DateTime(1990),
      lastDate: DateTime.now(),
    ).then((pickDate) {
    if (pickDate != null) {
        setState(() {
          newUser.birthdate = DateFormat("yyyy-MM-dd hh:mm:ss").format(pickDate);
          birthdate = pickDate;
          print(newUser.birthdate);

        });
    } });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(      
          body: Container(
            decoration: BoxDecoration(
              color:const Color(0xFFF5F5F5),
            ),
            child: Column(
                children: [
                  
                  SizedBox(height: 100,),
                  Second_App_Title(text1:"Créer un ", text2:"compte"),
                  Form(
                    key: formKey,
                    child: Column(
                      children : [
                        Container(
                          width: 300,
                          padding: const EdgeInsets.only(top: 30),
                          child: TextFormField(

                            onSaved: (value) => newUser.name = value!,

                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(      
                                borderSide: BorderSide(color: Color(0xFF909090)),   
                              ),  
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF202020)),
                              ),
                              labelText: 'Nom',
                              labelStyle: const TextStyle(
                                  color: Color(0xFF424242),
                                  fontWeight: FontWeight.w500,
                              )
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          padding: const EdgeInsets.only(top: 30),
                          child: TextFormField(

                            onSaved: (value) => newUser.firstname = value!,

                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(      
                                borderSide: BorderSide(color: Color(0xFF909090)),   
                              ),  
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF202020)),
                              ),
                              labelText: 'Prénom',
                              labelStyle: const TextStyle(
                                  color: Color(0xFF424242),
                                  fontWeight: FontWeight.w500,
                              )
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          padding: const EdgeInsets.only(top: 30),
                          child: TextFormField(

                            onSaved: (value) => newUser.pseudo = value!,

                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(      
                                borderSide: BorderSide(color: Color(0xFF909090)),   
                              ),  
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF202020)),
                              ),
                              labelText: 'Pseudo',
                              labelStyle: const TextStyle(
                                  color: Color(0xFF424242),
                                  fontWeight: FontWeight.w500,
                              )
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          padding: const EdgeInsets.only(top: 30),
                          child: TextFormField(

                            onSaved: (value) => newUser.email = value!,
                            validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Saisissez un email valide'
                                  : null,
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(      
                                borderSide: BorderSide(color: Color(0xFF909090)),   
                              ),  
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF202020)),
                              ),
                              labelText: 'E-mail',
                              labelStyle: const TextStyle(
                                  color: Color(0xFF424242),
                                  fontWeight: FontWeight.w500,
                              )
                            ),
                          ),
                        ),

                        Container(
                          width: 300,
                          padding: const EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                            child: Text((birthdate == null)
                                ? "Pick a date"
                                : DateFormat('dd/MM/yyyy').format(birthdate!)),
                            onPressed: setDate,
                          ),

                        ),


                        
                        Container(
                          width: 300,
                          padding: const EdgeInsets.only(top: 30),
                          child: TextFormField(

                            onSaved: (value) => newUser.password = value!,

                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(      
                                borderSide: BorderSide(color: Color(0xFF909090)),   
                              ),  
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF202020)),
                              ),
                              labelText: 'Mot de passe',
                              labelStyle: const TextStyle(
                                  color: Color(0xFF424242),
                                  fontWeight: FontWeight.w500,
                              )
                            ),
                          ),
                        ),
                      
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                            child: Text(
                              'Créer mon compte',
                              style: GoogleFonts.montserrat(
                                color: Color(0xFF4202020),
                                decoration: TextDecoration.none,
                                fontSize: 14.0,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                              primary: Colors.white,
                              side: BorderSide(color: Color(0xFF202020), width: 1.0, style: BorderStyle.solid), 
                              elevation: 0,
                              shadowColor: Color(0xFFFFFFFF)
                            ),
                            onPressed:() { submitForm();},
                          ),
                        ),
                      ]
                    ),
                  ),
                ],
            ),
          ), 
        );
  }
}

