import 'package:betterflutterapp/models/user_model.dart';
import 'package:betterflutterapp/screens/auth/auth_screen.dart';
import 'package:betterflutterapp/services/authentification.dart';
import 'package:flutter/material.dart';

import 'fragment/bottom_app_bar.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

// je gere ma navigation ici pour éviter d'appeler auth
// dans une vue, je me suis dis qu'il y avait une certaine logique
class _NavigationState extends State<Navigation> {
  Authentification _auth = Authentification();

  List<Widget> _widgets = [];
  int _indexSelected = 0;
  String _email = "";
  String _name = "";
  String _password = "";

  @override
  void initState() {
    super.initState();

    _widgets.addAll([
      AuthScreen(
        onChangedStep: (index, email, name, password) => setState(() {
          _indexSelected = index;
          _email = email;
          _password = password;
          _name = name;

          _auth
              .auth(UserModel.withoutUid(
            email: _email,
            name: _name,
            password: _password,
          ))
              .catchError((e) {
            print('erreur $e');
          });
        }),
      ),
      BottomNavBar(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}
