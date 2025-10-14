import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nha_228/features/auth/models/user_model.dart';

class FirestorUser {
 CollectionReference user = FirebaseFirestore.instance.collection('users');
  Future<void> addUser(UserModel userModel) {
    return user
        .doc(userModel.uid)
        .set(userModel.toMap());

  }
}