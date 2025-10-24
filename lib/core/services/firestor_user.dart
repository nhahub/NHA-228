import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nha_228/features/auth/models/user_model.dart';

class FirestorUser {
  CollectionReference user = FirebaseFirestore.instance.collection('users');
  final uid = FirebaseAuth.instance.currentUser?.uid;
  Future<void> addUser(UserModel userModel) async {
    return await user.doc(userModel.uid).set(userModel.toMap(), SetOptions(merge: true));
  }

  Future<UserModel?> getUser(String uid) async {
    DocumentSnapshot doc = await user.doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }
}
