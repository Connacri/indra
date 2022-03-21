import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home_After_Auth extends StatelessWidget {
  const Home_After_Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
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
            ),
            SizedBox(height: 8),
            Text(
              user.email!.toUpperCase(),
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 20,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                onPressed: () => FirebaseAuth.instance.signOut(),
                icon: Icon(Icons.arrow_back, size: 32),
                label: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 24),
                )),
          ],
        ),
      ),
    );
  }
}
