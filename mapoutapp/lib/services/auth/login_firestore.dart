import 'package:cloud_firestore/cloud_firestore.dart';

class LoginMethodsDB{
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String name = '';

  Future<void> addUser(){
    return users
    .add({
      'name': name,
    })
    .then((value) => print("User Added"))
    .catchError((error) => print("Failed to add user: $error"));
  }
}