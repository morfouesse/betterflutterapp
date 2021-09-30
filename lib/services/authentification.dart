import 'package:betterflutterapp/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentification {
  FirebaseAuth _auth = FirebaseAuth.instance;

  //  user courant
  Stream<UserModel> get user {
    return _auth.authStateChanges().asyncMap((user) =>
        //TODO: il faudra gérer le cas d'un user à supprimer
        UserModel(user!.uid));
  }

  Future<UserModel> auth(UserModel userModel) async {
    UserCredential userCredential;

    // on se connecte si il y a un user
    try {
      //user.map((userItem) async {
      // if(userItem != null) {
      //Credential pour les objets de firebase
      userCredential = await _auth
          .signInWithEmailAndPassword(
              email: userModel.email, password: userModel.password)
          .catchError((e) {
        print('erreur $e');
      });
    } catch (e) {
      //else{
      userCredential = await _auth
          .createUserWithEmailAndPassword(
              email: userModel.email, password: userModel.password)
          .catchError((e) {
        print('erreur $e');
      });

      // l'id du user credential devient le meme que celui du user model
      userModel.setUid = userCredential.user!.uid;
    }
    // });

    return userModel;
  }

}
