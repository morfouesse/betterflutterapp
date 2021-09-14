import 'package:betterflutterapp/models/user_model.dart';
import 'package:betterflutterapp/screens/auth/auth_screen.dart';
import 'package:betterflutterapp/screens/todo_list/todo_list_screen.dart';
import 'package:betterflutterapp/services/authentification.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
    Authentification _auth = Authentification();

    List<Widget> _widgets = [];
    int _indexSelected = 0;
    String _email = "";
    String _name = "";
    String _password= "";




    @override
    void initState(){
      super.initState();

      _widgets.addAll([

        AuthScreen(
        onChangedStep: (index, email, password, name) =>
          setState(() {


              _indexSelected = index;
              _email = email;
              _password = password;
              _name = name;

              // premier parametre le uid
              // à ce moment là on en à pas besoin
             _auth.auth(UserModel("",
                  email: _email,
                  name: _name,
                  password: _password,
              )).then((
                 value) => print(value.toJson())
             );

          }),
        ),
        TodoList(),

      ]);
    }

    @override
    Widget build(BuildContext context) {
      return Container(
        child: _widgets.elementAt(_indexSelected),
      );

  }
}
