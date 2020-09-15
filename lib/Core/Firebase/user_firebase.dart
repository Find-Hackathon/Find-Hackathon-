import 'package:firebase_auth/firebase_auth.dart';

class UserFirebase {
  final FirebaseAuth _firebaseAuth;

  UserFirebase() : _firebaseAuth = FirebaseAuth.instance;
  void createAccountFirebase(String email, String password) {
    _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<String> signinFirebase(String email, String password) async {
    String _userId;
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        _userId = value.user.uid;
      }).catchError((onError) {});
    } catch (e) {}
    return _userId;
  }
}
