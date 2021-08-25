import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study/domains/entities/UseCaseModel.dart';
import 'package:study/presentation/screens/Comments.dart';

class AuthenticationService extends UserDataModel {
  AuthenticationService({
    required String username,
    required String usermail,
    required String userpassword,
  }) : super(
          username: username,
          usermail: usermail,
          userpassword: userpassword,
        );
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<String?> signIn() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: usermail, password: userpassword);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: usermail, password: userpassword);
      await firebaseFirestore.collection('dataofuser').add({
        "username": username,
        "useremail": usermail,
      });
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> ShwoingName() async {
    try {
      await _firebaseAuth.authStateChanges().listen((event) {
        if (event != null) {
          event.displayName;
        }
      });
      return "SaveData";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  void Shwoingemail() {
    try {
      _firebaseAuth.authStateChanges().listen((event) {
        if (event != null) {
          event.email;
        }
      });
    } on FirebaseAuthException catch (e) {}
  }
}
