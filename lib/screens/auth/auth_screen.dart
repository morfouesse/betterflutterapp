import 'package:betterflutterapp/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  // auth_screen devra avoir une route (navigation)
  // avec un index pour les différentes pages
  // et string pour savoir les differentes info du user
  final Function(int, String, String, String) onChangedStep;

  // le onChangedStep sera lié à l'instance de AuthScreen
  // donc il faudra renseigné les différente info d'une
  // inscription pour aller sur AuthScreen
  AuthScreen({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");


  bool _isSecret = true;

  String _email = "";
  String _name = "";
  String _password = "";


  @override
  Widget build(BuildContext context) {
    // pour empecher l'orientation portrait
    // ne fct peut etre pas sur iphone
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final backgroundColor = Colors.indigo[900];
    final overlayColor = Colors.indigo[100];
    final textWhiteColor = Colors.white;


    return Scaffold(
      backgroundColor: backgroundColor,
      body: new Container(
        // me permet d'éviter un probleme d'affichage
        child:SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 150,
            horizontal: 30,
          ),
          child: new Form(
            key: _formKey,
            child: new Column(
              children: [
                Text(
                  'Bienvenue !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: textWhiteColor,
                  ),
                ),
                SizedBox(height: 100.0),
                //Name
                TextFormField(
                  onChanged: (value) => setState(() => _name = value),
                  decoration: textInputDecoration.copyWith(hintText: 'name'),

                  validator: (value) =>
                  value == null || value.isEmpty ? "Entrer un nom valide" : null,
                ),
                SizedBox(height: 10.0),
                //Email
                TextFormField(
                  onChanged: (value) => setState(() => _email = value),
                  decoration: textInputDecoration.copyWith(hintText: 'email'),
                  validator: (value) =>
                  !emailRegex.hasMatch(value!) || value.isEmpty ? "Entrer un email valide" : null,
                ),
                SizedBox(height: 10.0),
                //Password
                TextFormField(
                  onChanged: (value) => setState(() => _password = value),
                  // constante pour le style d'un champ
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () =>
                            setState(() => _isSecret = !_isSecret),
                        child: Icon(
                          !_isSecret
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: backgroundColor,
                        ),
                      ),
                      hintText: 'mot de passe',
                    //intérieur champs de saisie blanc
                    fillColor: Colors.white,
                    // champs completement rempli
                    filled: true,
                    // padding qui permet que se soit pas collé au bord
                    contentPadding: EdgeInsets.all(12.0),
                    // si j'ai une erreur
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red, width: 1.0
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red, width: 1.0
                      ),
                    ),
                    //bordure bleu grise
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.blueGrey, width: 1.0
                      ),
                    ),
                    // quand c'est focus(quand on saisie quelque chose)
                    //le champ sera bleu
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.lightBlue, width: 2.0
                      ),
                    ),
                  ),
                  obscureText: _isSecret,
                  validator: (value) =>
                  // minimum pour firebase 6 caracteres
                  value!.length < 6 ?
                  "Enter a password with at least 6 characteres" :
                  null,
                ),
                SizedBox(height: 70.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    overlayColor: MaterialStateProperty.all<Color>(overlayColor!),
                  ),
                  child: Text( 'Se connecter',
                    style: TextStyle(
                      color: backgroundColor,
                    ),
                  ),

                  onPressed: () async{
                    // on valide le formulaire
                    if(_formKey.currentState!.validate()){
                      // on va à la vue suivante
                     await widget.onChangedStep(1,
                        _email,
                        _name,
                        _password,
                      );
                    }
                  },
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
