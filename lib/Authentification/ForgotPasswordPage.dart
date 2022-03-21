import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indra/Authentification/login_widget.dart';
import 'package:indra/Authentification/main.dart';
import 'package:indra/Authentification/reset_mail_confirmation.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      //   resizeToAvoidBottomInset: false,
        resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Container(
        //padding: EdgeInsets.symmetric(horizontal: 25, vertical: 48),
        child: ListView(
          shrinkWrap: true,

            //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              SizedBox(height: 40),
             // if (!isKeyboard)
                FlutterLogo(size: 120),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Receive an E-mail ton\reset your password',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24),
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
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(50),
                          ),
                          onPressed: resetPassword,
                          icon: Icon(Icons.email, size: 32),
                          label: Text(
                            'Reset Password'.toUpperCase(),
                            style: TextStyle(fontSize: 24, fontFamily: 'Oswald'),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),

      ),
    );
  }

  Future resetPassword() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog<void>(
        context: context,
        barrierDismissible: false,
        // false = user must tap button, true = tap outside dialog
        builder: (context) => Center(child: CircularProgressIndicator()));



    try {
      await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());

      Fluttertoast.showToast(
          msg: "Reset Email Was Sent Verify Your Spam Inbox",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.indigo,
          textColor: Colors.white,
          fontSize: 50.0);

      //Navigator.of(context).popUntil((route) => route.isFirst);

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
          msg: 'E-mail Invalide',
        );
      }else if (e.code == 'missing-android-pkg-name') {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
            msg: 'Android Nom du Package Manqué',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 25.0);
      } else if (e.code == 'missing-continue-uri') {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
            msg: 'Manque uri',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 25.0);
      } else if (e.code == 'missing-ios-bundle-id') {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
            msg: 'Manque ios Bundle',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 25.0);
      } else if (e.code == 'invalid-continue-uri') {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
            msg: 'Invalide uri',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 25.0);
      } else if (e.code == 'unauthorized-continue-uri') {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
            msg: 'No Autorisé uri',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 25.0);
      } else {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
        return Fluttertoast.showToast(
            msg: 'user-not-found',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 25.0);
      }

    }
  }


}
//
// **auth/invalid-email**\ Thrown if the email address is not valid.
// **auth/missing-android-pkg-name**\ An Android package name must be provided if the Android app is required to be installed.
// **auth/missing-continue-uri**\ A continue URL must be provided in the request.
// **auth/missing-ios-bundle-id**\ An iOS Bundle ID must be provided if an App Store ID is provided.
// **auth/invalid-continue-uri**\ The continue URL provided in the request is invalid.
// **auth/unauthorized-continue-uri**\ The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.
// **auth/user-not-found**\ Thrown if there is no user corresponding to the email address.