import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authstateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async{
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

   Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
}