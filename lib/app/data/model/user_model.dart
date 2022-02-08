import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String id;
  late String name;
  late String email;
  late String urlimage;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.urlimage});

  UserModel.fromSnapshor(DocumentSnapshot snapshot)
      : id = snapshot.id,
        name = snapshot.get(["name"]),
        email = snapshot.get(["email"]),
        urlimage = snapshot.get(["urlimage"]);

  Map<String, String> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'urlimage': urlimage,
    };
  }
}
