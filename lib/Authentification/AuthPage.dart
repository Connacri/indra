import 'package:flutter/material.dart';
import 'package:indra/Authentification/SignUpWidget.dart';
import 'package:indra/Authentification/login_widget.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginWidget(onClikedSignUp: toggle,)
      : SignUpWidget(onClickedSignIn: toggle, onClikedSignUp: toggle);
  void toggle()=> setState(() => isLogin = !isLogin);
}
