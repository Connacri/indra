import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class tmanyik extends StatefulWidget {
  const tmanyik({Key? key}) : super(key: key);

  @override
  _tmanyikState createState() => _tmanyikState();
}

class _tmanyikState extends State<tmanyik> {
  final emailController = TextEditingController();
  final emailController1 = TextEditingController();
  final emailController2 = TextEditingController();
  final emailController3 = TextEditingController();
  final emailController4 = TextEditingController();
  final emailController5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController1,
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
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController2,
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
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController3,
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
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController4,
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
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController5,
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

        ],
      ),
    );
  }
}
