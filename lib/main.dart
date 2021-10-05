import 'package:betterflutterapp/screens/splash_screen.dart';
import 'package:betterflutterapp/services/internet_connexion/connectivity_change_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
    // on observe les differents etats de la connexion internet
    // sur l'appli avec la dépendance Provider
    return ChangeNotifierProvider(
        create: (context) {
          // on met en place une verif sur la connexion internet
          // et sur les données mobile
          ConnectivityChangeNotifier changeNotifier =
          ConnectivityChangeNotifier();
          changeNotifier.initialLoad();
          return changeNotifier;
        },
    child: MaterialApp(
    ///////////////HOME//////////
      debugShowCheckedModeBanner: false,
      home: SplashScreen()//TodoList()
      ),
    );
  }
}