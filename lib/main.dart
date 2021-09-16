import 'package:betterflutterapp/screens/navigation.dart';
import 'package:betterflutterapp/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async{

  // faire inisialiser firebase simplement
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
///
/// app to do list
///
/// inscripiton lors de la premiere utilisation de l'appli
///
///
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final backgroundColor = Colors.indigo[900];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///////////////HOME//////////
      debugShowCheckedModeBanner: false,
      home: SplashScreen()//TodoList()
      );
  }
}