import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:betterflutterapp/screens/navigation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: Colors.indigo[900]!,
        splash: Center(
          child: Container(
            child: Text(
              'To do List',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
        ), nextScreen:  Navigation(),
        splashTransition: SplashTransition.slideTransition,
        animationDuration: Duration(milliseconds: 1500),
      ),
    );
  }
}

