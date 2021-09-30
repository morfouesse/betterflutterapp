class UserModel{
  // je le met pas en final car
  // //l'uid sera implémenter un peu plus tard
  // car je doit utiliser des fonctions avec des uid
  // qui peuvent etre null
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


  UserModel.full(
      this.uid,
      {required this.email,
        required this.name,
        required this.password
      });



  set setUid(value) => uid = value;

  Map<String, dynamic> toJson() => {
    'uid' : uid,
    'email' : email,
    'password' : password,
    'name' : name
  };
}


