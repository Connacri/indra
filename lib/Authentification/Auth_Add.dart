import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indra/AddImage.dart';
import 'package:indra/Authentification/AuthPage.dart';
import 'package:indra/Authentification/Test.dart';
import 'package:indra/Authentification/Utils.dart';
import 'package:indra/Authentification/home_auth1.dart';
import 'package:indra/Authentification/login_widget.dart';
import 'package:indra/Authentification/tmanyik.dart';

//final navigatorKey = GlobalKey<NavigatorState>();

// class MyAppAuth extends StatelessWidget {
//   const MyAppAuth({Key? key}) : super(key: key);
//
//   //static const String _title = 'Firebase Auth';
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//           body: StreamBuilder<User?>(
//               stream: FirebaseAuth.instance.authStateChanges(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Something went wrong!!!'));
//                 } else if (snapshot.hasData) {
//                   return HomePage1();
//                 } else {
//                   return AuthPage();
//                 }
//               }),
//        //MainPage(),
//       );
// }


class Auth_add extends StatelessWidget {
  const Auth_add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
           if (snapshot.hasData) {
            return AddImage();//HomePage1();
          } else {
            return test_login(onClikedSignUp: () {  },);//AuthPage();
          }
        }),
  );
}
