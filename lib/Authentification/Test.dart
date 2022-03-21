import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indra/Authentification/ForgotPasswordPage.dart';
import 'package:indra/main.dart';


class test_login extends StatefulWidget {

  final VoidCallback onClikedSignUp;

  const test_login({Key? key, required this.onClikedSignUp}) : super(key: key);

  @override
  _test_loginState createState() => _test_loginState();
}

class _test_loginState extends State<test_login> {

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


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: Image.asset(
                    'assets/images/background_image.jpg',
                    // #Image Url: https://unsplash.com/photos/bOBM8CB4ZC4
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Center(
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 7,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                              child: SizedBox(
                                width: size.width * .9,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: size.width * .15,
                                        bottom: size.width * .1,
                                      ),
                                      child: Text(
                                        'SIGN IN',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white.withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                    // component(
                                    //   Icons.account_circle_outlined,
                                    //   'User name...',
                                    //   false,
                                    //   false,
                                    // ),


                                    component(
                                      Icons.email_outlined,
                                      'Email...',
                                      false,
                                      true,
                                    ),
                                    component(
                                      Icons.lock_outline,
                                      'Password...',
                                      true,
                                      false,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: 'Forgotten password!',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ForgotPasswordPage()));
                                                HapticFeedback.lightImpact();
                                                Fluttertoast.showToast(
                                                  msg:
                                                  'Forgotten password! button pressed',
                                                );
                                              },
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Create a new Account',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                HapticFeedback.lightImpact();
                                                Fluttertoast.showToast(
                                                  msg:
                                                  'Create a new Account button pressed',
                                                );
                                              },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size.width * .3),
                                    // ElevatedButton.icon(
                                    //     style: ElevatedButton.styleFrom(
                                    //       minimumSize: Size.fromHeight(50),
                                    //     ),
                                    //     onPressed: signIn,
                                    //     icon: Icon(Icons.lock_open, size: 32),
                                    //     label: Text(
                                    //       'Se Connecter'.toUpperCase(),
                                    //       style: TextStyle(fontSize: 24, fontFamily: 'Oswald'),
                                    //     )),

                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        signIn;
                                        HapticFeedback.lightImpact();
                                        Fluttertoast.showToast(
                                          msg: 'Sign-In button pressed',
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          bottom: size.width * .05,
                                        ),
                                        height: size.width / 8,
                                        width: size.width / 1.25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(.1),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          'Sing-In',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget component(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: isEmail ? emailController : passwordController,//*************************************************
        autovalidateMode: AutovalidateMode.onUserInteraction,//************************

        validator: isEmail ? (email) => //**********************************************
        email != null && !EmailValidator.validate(email)
            ? 'Entrer a Valide E-Mail'
            : null

        : (value) => value != null && value.length < 6
            ? 'Entrer min 6 characteres.'
            : null,

        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
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

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context,
      Widget child,
      AxisDirection axisDirection,
      ) {
    return child;
  }


}