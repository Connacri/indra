import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/src/auth/configs/email_provider_configuration.dart';



class ProfileTest extends StatelessWidget {

  const ProfileTest({Key? key, required List<EmailProviderConfiguration> providerConfigs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Profile'),
          actions: [
            IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: Icon(Icons.logout),
            )
          ],
        ),
        body: Center(
          child: Text(
            'Mon Profile.'.toUpperCase(),
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.normal,
              fontSize: 30,
              fontFamily: 'Oswald',
            ),
          ),
        ));
  }
}
