import 'package:recipe_app/layout/all_layout.dart';
import 'package:recipe_app/model/user_provider.dart';
import 'package:recipe_app/model/user_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class Update_Account extends StatefulWidget {
  static String routeName = '/update-account';

  const Update_Account({Key? key}) : super(key: key);
  
  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Update_Account_State createState() {
      return _Update_Account_State();
  } 
}


class _Update_Account_State extends State<Update_Account> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final UserProvider userProvider = UserProvider();

  late User newUser;

  User? user;
  String id = "";
  
    
  @override
  void initState() {
    newUser = User(
      name: " ",
      firstname: " ",
      pseudo: " ",
      birthdate : '',
      email: " ",
      password: "",
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
        ).updateUser(newUser, id);

        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()

          ..showSnackBar(
            SnackBar(
              content: Text("Votre profil a été modifié ${newUser.firstname} !"),
            ), 
          );
        
     }
    } catch (e) {
      print("error !");
    }
  }

  

  @override
  Widget build(BuildContext context) {
    final UpdateData userData = ModalRoute.of(context)!.settings.arguments as UpdateData;
    
    Provider.of<UserProvider>(context).selectByEmail(userData.email);

    List<User> users = Provider.of<UserProvider>(context).users;
    
    id = users[0].id as String;

    return Scaffold(  
          key: _scaffoldKey,
          drawer: Drawer_Implement(email: userData.email,),
          body: Container(
            decoration: BoxDecoration(
              color:const Color(0xFFF5F5F5),
            ),
            child: Column(
                children: [
                  
                  Top_Bar(scaffoldKey : _scaffoldKey,  email : userData.email),
                  Second_App_Title(text1:"Modifier un ", text2:"compte"),
                  
                  

                  Form(
                    key: formKey,
                    child: Column(
                      children : [
                        Visibility(
                          visible: false,
                          child : TextFormField(
                            initialValue : users[0].id,

                            onSaved: (value) => id = value!,
                          ),
                        ),
                        Container(
                          width: 300,
                          
                          padding: const EdgeInsets.only(top: 30),
                          child: TextFormField(
                            initialValue : users[0].name,

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
                            initialValue : users[0].firstname,

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
                            initialValue : users[0].pseudo,
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
                            initialValue : users[0].email,

                            onSaved: (value) => newUser.email = value!,

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
                          padding: EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                            child: Text(
                              'Modifier mon compte',
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

class UpdateData {
  final String email;

  UpdateData({required this.email});
}