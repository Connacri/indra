import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indra/AddImage.dart';
import 'package:indra/Auth/Sign_In.dart';
import 'Home_After_Auth.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class Main_Auth extends StatelessWidget {
  const Main_Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return AddImage(); //Home_After_Auth();
              } else {
                return Sign_In();
              }
            }),
      );
}
