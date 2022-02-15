//import 'dart:html';

//import 'package:firebase_auth/firebase_auth.dart';


// class AuthService {
//   final FirebaseAuth _auth;
//   AuthService(this._auth);
//   Stream<User?> get authStateChanges => _auth.idTokenChanges();
//   Future<Object> login(String email, String pasword) async {
//     try {
//       var password;
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return "Logged in";
//     } catch (e) {
//       return e;
//     }
//   }
// }

// Future<Object> login(String email, String password) async {
//   try {
//     var _auth;
//     await _auth.signInWithEmailAndPassword(email: email, password: password);
//     return 'Logged In';
//   } catch (e) {
//     return e;
//   }}

