import 'dart:ui';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indra/Authentification/ForgotPasswordPage.dart';
import 'package:indra/main.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClikedSignUp;

  const LoginWidget({Key? key, required this.onClikedSignUp}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final formKey = GlobalKey<FormState>();
  //final loginKey = GlobalKey<ScaffoldState>();
  //final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  //
  // late FToast fToast;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   fToast = FToast();
  //   fToast.init(context);
  // }

  // _showToast(FirebaseAuthException e) {
  //   Widget toast = Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(25.0),
  //       color: Colors.redAccent,
  //     ),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Icon(Icons.check),
  //         SizedBox(
  //           width: 12.0,
  //         ),
  //         Text('$e.message'),
  //       ],
  //     ),
  //   );
  //
  //   fToast.showToast(
  //     child: toast,
  //     gravity: ToastGravity.BOTTOM,
  //     toastDuration: Duration(seconds: 4),
  //   );
  //
  //   // Custom Toast Position
  //   fToast.showToast(
  //       child: toast,
  //       toastDuration: Duration(seconds: 2),
  //       positionedToastBuilder: (context, child) {
  //         return Positioned(
  //           child: child,
  //           top: 16.0,
  //           left: 16.0,
  //         );
  //       });
  // }

  //final MediaQueryData mediaQueryData = MediaQuery.of(context);

  @override
  Widget build(BuildContext context) {
   // final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    final baseLayout = Form(
        key: formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisSize: MainAxisSize.max,

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          //shrinkWrap: true,
          children: [
            SizedBox(height: 40),
            //if (!isKeyboard)
            FlutterLogo(
              size: 180.0,
              style: FlutterLogoStyle.horizontal,
              textColor: Colors.blue,
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 4000),
            ),//FlutterLogo(size: 120),
            SizedBox(height: 20),
            Text(
              'Hey Marhba Bikoum'.toUpperCase(),
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
                  labelStyle:
                  TextStyle(fontFamily: 'Oswald', color: Colors.blue)),
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
                  labelStyle:
                  TextStyle(fontFamily: 'Oswald', color: Colors.blue)),
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
                onPressed: signIn,
                icon: Icon(Icons.lock_open, size: 32),
                label: Text(
                  'Se Connecter'.toUpperCase(),
                  style: TextStyle(fontSize: 24, fontFamily: 'Oswald'),
                )),
            SizedBox(height: 20),
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontFamily: 'Oswald'),
                    text: 'J\'ai Pas de Compte ?  '.toUpperCase(),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClikedSignUp,
                          text: 'S’inscrire',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondary,
                          ))
                    ])),
            SizedBox(height: 40),
            GestureDetector(
              child: Text(
                'Nssite Password',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
              onTap: () {
                //wrong way: use context in same level tree with MaterialApp
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage()));
              },
            ),
          ],
        ),
      );
    return Scaffold(

      body: Container(
        height: double.infinity,//MediaQuery.of(context).size.height,
        color: Colors.black12,
        margin: const EdgeInsets.all(20),
        child: baseLayout,
      ),
    );





  }

  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog<void>(
        context: context,
        barrierDismissible: true,
        //false = user must tap button, true = tap outside dialog
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        password: passwordController.text.trim(),
        email: emailController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
          msg: 'E-mail Invalide',
        );
      } else if (e.code == 'user-disabled') {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
            msg: 'Utlisateur Désactivé',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 25.0);
      } else if (e.code == 'user-not-found') {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
            msg: 'Utilisateur Non Trouvé',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 25.0);
      } else {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
            msg: 'Mot de passe incorrect',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 25.0);
      }

      // **invalid-email**:
      // Thrown if the email address is not valid.
      // **user-disabled**:
      // Thrown if the user corresponding to the given email has been disabled.
      // **user-not-found**:
      // Thrown if there is no user corresponding to the given email.
      // **wrong-password**:
      // Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.
      //

      //print(e);
      //e.message;
      //Utils.showSnackBar(e.message.toString());
      //  Fluttertoast.showToast(
      //      msg: "$error.message",
      //      toastLength: Toast.LENGTH_SHORT,
      //      gravity: ToastGravity.TOP,
      //      timeInSecForIosWeb: 1,
      //      backgroundColor: Colors.indigo,
      //      textColor: Colors.white,
      //      fontSize: 50.0
      //  );
      //_showToast(e);

    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

// class ScreenSizeService {
//   final BuildContext context;
//   const ScreenSizeService(
//       this.context,
//       );
//   Size get size => MediaQuery.of(context).size;
//   double get height => size.height;
//   double get width => size.width;
// }
