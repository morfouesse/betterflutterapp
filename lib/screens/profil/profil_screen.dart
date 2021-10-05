import 'package:flutter/material.dart';


class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final backgroundColor = Colors.indigo[900];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: <Widget>[
          Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Flexible(
            child: ElevatedButton(
              child: Text('Modifier son profile'),
              onPressed: () {},
            ),
          )
        ])
    );
  }
}
