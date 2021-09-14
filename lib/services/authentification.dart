import 'package:betterflutterapp/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Authentification{

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> auth(UserModel userModel) async {

    UserCredential userCredential;

    // on se connecte si il y a un user
    try {
      //Credential pour les objets de firebase
      userCredential = await _auth.signInWithEmailAndPassword(
          email: userModel.email, password: userModel.password
      );



    } // pas de user alors on créer un user
    catch (e) {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password
      );
    }
    // l'id du user credential devient le meme que celui du user model
    userModel.setUid = userCredential.user!.uid;
    return userModel;
  }
}