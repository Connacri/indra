import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScriptPagination extends StatefulWidget {
  const ScriptPagination({Key? key}) : super(key: key);

  @override
  _ScriptPaginationState createState() => _ScriptPaginationState();

}

class _ScriptPaginationState extends State<ScriptPagination> {

  Future<QuerySnapshot> _TopHotelFuture = FirebaseFirestore.instance
      .collection('Products')
      .where('category', isEqualTo: 'Hotel')
      .limit(3)
      .get();

  late DocumentSnapshot lastVisible;

  Future<QuerySnapshot> _GridListTotal = FirebaseFirestore.instance
      .collection('Products')
      .orderBy('createdAt', descending: true)
      //.limit(10)
      .get();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child : Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Top Hôtel',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Oswald'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: 'Super',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Oswald',
                                            fontSize: 18,
                                            color: Colors.red)),
                                    TextSpan(
                                        text: 'Deals',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Oswald',
                                            fontSize: 18,
                                            color: Colors.blue)),
                                  ],
                                  //text: 'Aujourd\'Hui ',
                                ),
                              )),
                        ),
                        Icon(Icons.arrow_forward_ios_sharp),
                        /*add_to_photos_rounded
                            arrow_forward_ios_sharp
                            arrow_right_sharp*/
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder<QuerySnapshot>(
                      future: _TopHotelFuture,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text("Loading");
                        }

                        return ListView(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> _data =
                            document.data()! as Map<String, dynamic>;
                            return CardR(data: _data);
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ), // ListView Horizontal Filtered Top Hotel

            FutureBuilder<QuerySnapshot>(
                    future: _GridListTotal,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      //print(snapshot.connectionState);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return const Text('Error');
                        } else if (snapshot.hasData) {
                          return GridView.count(

                            crossAxisCount: 2,
                            childAspectRatio: 1.0,
                            //mainAxisSpacing: 0.5,
                            //crossAxisSpacing: 0.5,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children:
                            snapshot.data!.docs.map((DocumentSnapshot document) {
                              Map<String, dynamic> _data =
                              document.data()! as Map<String, dynamic>;
                              print(_GridListTotal.toString());

                              /* final List<String> images =
                                    List.from(document['urls']);

                                    List<GridTile> newGridTile = [];

                                    images.forEach((image) {
                                      newGridTile.add(GridTile(
                                        child: Image.network(
                                          image,
                                          fit: BoxFit.cover,
                                        ),
                                      ));
                                    });*/

                              return Padding(
                                padding: const EdgeInsets.fromLTRB(6, 4, 4, 4),
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
                                            _data['item'].toUpperCase(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                              fontFamily: 'Oswald',
                                            ),
                                          ),
                                          subtitle: Text(
                                            _data['price'] + '.00 DZD',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.indigoAccent,
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
                                          imageUrl: _data['themb'],
                                          /*placeholder: (context, url) => Center(
                                                  child: CircularProgressIndicator(),
                                                ),*/
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
                              );
                            }).toList(),
                          );
                        } else {
                          return const Text('Empty data');
                        }
                      } else {
                        return Text('State: ${snapshot.connectionState}');
                      }
                    }),
          ],
        ),



      ),
    );
  }
}

class CardR extends StatelessWidget {
  const CardR({
    Key? key,
    required Map<String, dynamic> data,
  })  : _data = data,
        super(key: key);

  final Map<String, dynamic> _data;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      semanticContainer: true,
      color: Colors.white70,
      child: Container(
        height: MediaQuery.of(context).size.width * 0.15,
        width: MediaQuery.of(context).size.width * 0.30,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.darken,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: _data['themb'],
                  /*placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),*/
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              //height: 60,
              //color: Colors.black45,

              child: ListTile(
                title: Text(
                  _data['item'].toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    fontFamily: 'Oswald',
                  ),
                ),
                subtitle: Text(
                  _data['price'] + '.00 DZD',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontFamily: 'Oswald',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
