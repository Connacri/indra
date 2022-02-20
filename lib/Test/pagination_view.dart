import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RamzyPagination extends StatefulWidget {
  const RamzyPagination({Key? key}) : super(key: key);

  @override
  _RamzyPaginationState createState() => _RamzyPaginationState();
}

class _RamzyPaginationState extends State<RamzyPagination> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _products = [];
  bool _loadingProducts = true;

  _getProducts() async {
    setState(() {
      _loadingProducts = true;
    });

    QuerySnapshot querySnapshot = await _firestore
        .collection('Products')
        .orderBy('createdAt', descending: true)
        //.limit(10)
        .get();
    //_products = querySnapshot.docs;

    setState(() {
      _loadingProducts = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  Future<QuerySnapshot> _GridListTotal = FirebaseFirestore.instance
      .collection('Products')
      .orderBy('createdAt', descending: true)
      //.limit(10)
      .get();

  @override
  Widget build(BuildContext context) {
    return Container(child:
      //  _products.length == 0
      //     ? Center(
      //         child: Text('No data rmimez'),
      //       )
      //     :
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
                      //physics: NeverScrollableScrollPhysics(),
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
    );
  }
}
