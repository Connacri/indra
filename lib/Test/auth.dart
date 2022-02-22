import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:indra/AddImage.dart';
import 'package:indra/Test/testProfile.dart';

class auth extends StatelessWidget {
  const auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AddImage();
          //   ProfileTest(
          //   providerConfigs: [
          //     EmailProviderConfiguration(),
          //   ],
          // );
        } else {
          return SignInScreen(
            providerConfigs: [
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(clientId: ''),
            ],
            headerBuilder: (context, constraints, _) => Padding(
              padding: EdgeInsets.all(20),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network('https://picsum.photos/500/300?random=1'),
              ),
            ),
            subtitleBuilder: (context, action) => Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                action == AuthAction.signIn
                    ? 'Welcome Cher Amis'
                    : 'Marhba bikom hbabna',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  fontFamily: 'Oswald',
                ),
              ),
            ),
            footerBuilder: (context, _) => Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'By SignIn, you agree to our terms and conditions'
                    .toUpperCase(),
                //overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  fontFamily: 'Oswald',
                ),
              ),
            ),
          );
        }
      });
}
