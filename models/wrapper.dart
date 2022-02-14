//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myhostel/models/auth_service.dart';
import 'package:myhostel/models/auth_service.dart';
import 'package:myhostel/others/level1/home_screen.dart';
import 'package:myhostel/screens/loginScreen.dart';
import 'package:provider/provider.dart';
//lib\models\User_auth.dart
import 'package:myhostel/models/User_auth.dart';
import 'package:http/http.dart' as http;

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? LoginScreen() : HomeScreen();
          } else {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }
        });
    //return Container();
  }
}
