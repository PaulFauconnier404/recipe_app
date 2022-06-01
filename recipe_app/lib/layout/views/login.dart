import 'package:provider/provider.dart';
import 'package:recipe_app/layout/all_layout.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/model/user_model.dart';
import 'package:recipe_app/model/user_provider.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/layout/views/salt_meal.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String routeName = '/';

  // DATA FINAL (widget.name pour y acc ́eder depuis le State)
  @override
  _Login_State createState() {
    return _Login_State();
  }
}

class _Login_State extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late User user;

  bool _passwordVisible = false;
  String errorMessage = " ";

  String? email;
  String? password;


  @override
  Widget build(BuildContext context) {

   

    @override
    void initState() {
      email = "";
      password = "";

      super.initState();
    }

    Future<void> logUser() async {
      print(email);
      String rep = await Provider.of<UserProvider>(context, listen: false).logUser(email as String, password as String);
      if (rep == "200") {
        Navigator.pushNamed(
          context,
          Salt_Meal.routeName,
          arguments: LoginData(
            email: email as String,
          ),
        );
      } else {
        setState(() {
          errorMessage = rep;
        });
      }
    }

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        First_App_Title(),
         Form(
          key: formKey,
          child: Column(
            children: [
              Container( 
                width: 300,
                padding: const EdgeInsets.only(top: 0),
                child: TextFormField(
                  validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Saisissez un email valide'
                                  : null,
                  onSaved: (value) => email = value,
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
                      )),
                ),
              ),
              Container(
                width: 300,
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  obscureText: !_passwordVisible,

                  onSaved: (value) => password = value,
                  decoration: InputDecoration(
                     suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
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
                      )),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    child: Text(
                      'Connexion',
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF4202020),
                        decoration: TextDecoration.none,
                        fontSize: 14.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        primary: Colors.white,
                        side: BorderSide(
                            color: Color(0xFF202020),
                            width: 1.0,
                            style: BorderStyle.solid),
                        elevation: 0,
                        shadowColor: Color(0xFFFFFFFF)),
                    onPressed: () {
                      formKey.currentState?.save();
                      logUser();
                    },
                  )),
              Annexe_Button(
            text: "Créer un compte ?", size: 14, path: "/create-account"),
        ],),),
      
      ]),
    );
  }
}
