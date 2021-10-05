class UserModel{
  // je le met pas en final car
  // //l'uid par exemple sera implémenter un peu plus tard
  // car je doit utiliser des fonctions avec des uid
  // qui peuvent etre null avec des functions Firebase
  late String uid;
  late String email;
  late String name;
  late String password;

  UserModel(this.uid);

  UserModel.withoutUid(
      {required this.email,
        required this.name,
        required this.password
      });

  // pas utilisé pour l'instant
  /*UserModel.full(
      this.uid,
      {required this.email,
        required this.name,
        required this.password
      });
*/

  // un setter pour lié l'uid du model avec celui
  // de l'uid du credencial de firebase
  set setUid(value) => uid = value;

  // me servais juste à verifier mes données
  /*Map<String, dynamic> toJson() => {
    'uid' : uid,
    'email' : email,
    'password' : password,
    'name' : name
  };*/
}


