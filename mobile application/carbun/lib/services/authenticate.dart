import 'package:firebase_auth/firebase_auth.dart';
import 'package:carbun/models/users.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create User Object based on Firebase User
  CurrentUser _userFromFirebaseUser(User user) {
    return (user != null) ? CurrentUser(uID: user.uid) : null;
  }

  // auth change user stream
  Stream<CurrentUser> get user {
    return _auth
        .authStateChanges()
        // .map((FirebaseUser user) => _userFromFirebase(user));
        .map(_userFromFirebaseUser);
  }

  // Login with email and Password
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Signup with email and Password
  Future register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Reset Password Link
  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email).catchError((e) {
        print(e);
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
