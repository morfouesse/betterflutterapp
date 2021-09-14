class UserModel{
  // on le met pas en final car
  // //l'uid sera implémenter un peu plus tard
  String uid;
  final String email;
  final String name;
  final String password;

  UserModel(
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