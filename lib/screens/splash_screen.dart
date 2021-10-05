import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:betterflutterapp/screens/navigation.dart';
import 'package:betterflutterapp/services/authentification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'fragment/bottom_app_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Authentification _auth = Authentification();

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;

    // si c'est pas une tablette alors
    if (useMobileLayout) {
      // pour empecher l'orientation portrait
      // ne fct peut etre pas sur iphone
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    return Scaffold(
      // une dépendance pour faire simplement un splashscreen
      body: AnimatedSplashScreen(
        backgroundColor: Colors.indigo[900]!,
        splash: Center(
          child: Container(
            child: Text(
              'To do List',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        splashTransition: SplashTransition.slideTransition,
        animationDuration: Duration(milliseconds: 1000),
        // streambuilder permet de gérer le build(etat: active,
        // waiting par exemple) en creant un snapshot
        // qui peut intercepter les données d'un stream
        nextScreen: StreamBuilder(
            stream: _auth.user,
            builder: (context, AsyncSnapshot snapshot) {
              // si on à fini de chargé la vue et qu'il y a un user courant
              // alors on va sur la to do list sinon on crée son compte
              if (snapshot.connectionState == ConnectionState.active) {
                // me permet de vérifié l'uid du user courant
                if (snapshot.hasData) {
                  return BottomNavBar();
                }
                return Navigation();
              }
              //TODO: faire un Loading
              return Scaffold(
                body: Center(
                  child: Text('Loading'),
                ),
              );
            }),
      ),
    );
  }
}
