import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardTest extends StatefulWidget {
  const CardTest({Key? key}) : super(key: key);

  @override
  _CardTestState createState() => _CardTestState();
}

class _CardTestState extends State<CardTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POPOPOPO'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(6, 20, 4, 20),
        child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              //color: Colors.lightBlue,
              child: InkWell(
                child: GridTile(
                  footer: Container(
                    // height: 60,
                    //color: Colors.black45,
                    child: ListTile(
                      title: Text(
                        'sdfgdfsg'.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          fontFamily: 'Oswald',
                        ),
                      ),
                      subtitle: Text(
                        '12582.00 dzd' + '.00 DZD',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ),
                  ),
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black
                        ],
                      ).createShader(Rect.fromLTRB(
                          0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.darken,
                    child: CachedNetworkImage(
                      imageUrl: 'https://images.unsplash.com/photo-1521032078283-ca2eb1773c0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cmFuZG9tJTIwcGhvdG98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),

                  /*Image.network(
                                          _data['themb'],
                                          fit: BoxFit.cover,
                                        ),*/
                ),
                // focusColor: Colors.deepPurple ,
                onTap: () {},
              ),
            ),

      ),
    );
  }
}
