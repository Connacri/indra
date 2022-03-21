import 'dart:async';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:indra/Authentification/Utilsoth.dart';
import 'package:indra/main.dart';

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;
  final Function() onClikedSignUp;

  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
    required this.onClikedSignUp,
  }) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
            padding: //EdgeInsets.all(16),
            EdgeInsets.only(

              // change 1
                top: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,

                // change 2
                left: 10,
                right: 10),
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    FlutterLogo(size: 120),
                    SizedBox(height: 20),
                    Text(
                      'Hey Ha Dkhol'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Oswald'),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                              fontFamily: 'Oswald', color: Colors.blue)),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Entrer a Valide E-Mail'
                              : null,
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: 'Mot de Passe',
                          labelStyle: TextStyle(
                              fontFamily: 'Oswald', color: Colors.blue)),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Entrer min 6 characteres.'
                          : null,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                        ),
                        onPressed: signUp,
                        icon: Icon(Icons.lock_open, size: 32),
                        label: Text(
                          'S\'enregistrer'.toUpperCase(),
                          style: TextStyle(fontSize: 24, fontFamily: 'Oswald'),
                        )),
                    SizedBox(height: 20),
                    RichText(
                        text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Oswald',
                            ),
                            text: 'J\'ai Déja un Compte ?  '.toUpperCase(),
                            children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onClickedSignIn,
                              text: 'S’identifier',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).colorScheme.secondary,
                              ))
                        ])),
                  ]),
            )),
      );

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog<void>(
        context: context,
        barrierDismissible: true,
        //false = user must tap button, true = tap outside dialog
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        password: passwordController.text.trim(),
        email: emailController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
          msg: 'E-mail est déjà utilisée',
        );
      } else if (e.code == 'invalid-email') {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
            msg: 'E-mail Invalide',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 25.0);
      } else if (e.code == 'operation-not-allowed') {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
            msg: 'Opération non autorisée',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 25.0);
      } else {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
            msg: 'Mot de passe faible',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 25.0);
      }
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
