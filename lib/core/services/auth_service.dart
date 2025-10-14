import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static bool isUserLoggedIn() {
    final user = _auth.currentUser;
    return user != null;
  }
}
