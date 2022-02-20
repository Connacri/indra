import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indra/home.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:shimmer/shimmer.dart';



// class Pagina extends StatefulWidget {
//   const Pagina({Key? key}) : super(key: key);
//
//   @override
//   _PaginaState createState() => _PaginaState();
// }
//
// class _PaginaState extends State<Pagina> {
//
// }


class Pagina extends StatelessWidget {
  //const Pagina({Key? key}) : super(key: key);
  bool _enabled = true;

  Future<QuerySnapshot> _TopAgenceFuture = FirebaseFirestore.instance
      .collection('Products')
      .where('category', isEqualTo: 'Agence')
      .limit(3)
      .get();

  Future<QuerySnapshot> _TopHotelFuture = FirebaseFirestore.instance
      .collection('Products')
      .where('category', isEqualTo: 'Hotel')
      .limit(3)
      .get();

  Future<QuerySnapshot> _TopResidenceFuture = FirebaseFirestore.instance
      .collection('Products')
      .where('category', isEqualTo: 'Residence')
      .limit(3)
      .get();

  Future<QuerySnapshot> _TopSponsorFuture = FirebaseFirestore.instance
      .collection('Products')
      .where('category', isEqualTo: 'Autres')
      .limit(3)
      .get();

  Future<QuerySnapshot> _GridListTotal = FirebaseFirestore.instance
      .collection('Products')
      .orderBy('createdAt', descending: true)
  //.limit(100)
      .get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaginateFirestore(
        //itemsPerPage: 10,
        shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        itemBuilderType: PaginateBuilderType.gridView,
        isLive: true,
        query: FirebaseFirestore.instance
            .collection('Products')
            .orderBy('createdAt', descending: true),
        itemBuilder: (context, documentSnapshots, index) {
          final _data = documentSnapshots[index].data() as Map?;
          print(_data);
          return _data == null
              ? const Text('Error in data')
              : Padding(
            padding: const EdgeInsets.fromLTRB(6, 4, 4, 4),
            child: Hero(
              tag: 'detail',
              child: buildCard(_data),
            ),
          );
        },
      ),
    );
  }
  Card buildCard(Map<dynamic, dynamic> _data) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black],
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.darken,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: _data['themb'],
                      placeholder: (context, url) => Center(
                        //child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                  ), // image
                  Container(
                      padding: const EdgeInsets.fromLTRB(0, 05, 05, 0),
                      //alignment: Alignment.topLeft,
                      child: _data['category'] == 'Hotel'
                          ? Row(
                        children: [
                          Flexible(
                            flex: 4,
                            fit: FlexFit.loose,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                ' ' +
                                    _data['category'].toUpperCase() +
                                    ' ',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  backgroundColor: Colors.blue,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  fontFamily: 'Oswald',
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.blue,
                              //radius: 30,
                              child: Container(
                                child: const Icon(
                                  Icons.hotel,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ) // hotel
                          : _data['category'] == 'Agence'
                          ? Row(
                        children: [
                          Flexible(
                            flex: 4,
                            fit: FlexFit.loose,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                ' ' +
                                    _data['category'].toUpperCase() +
                                    ' ',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  backgroundColor: Colors.red,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  fontFamily: 'Oswald',
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.red,
                              //radius: 30,
                              child: Container(
                                //color: Colors.red,
                                child: Icon(
                                  Icons.account_balance,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ) // agence
                          : _data['category'] == 'Residence'
                          ? Row(
                        children: [
                          Flexible(
                            flex: 4,
                            fit: FlexFit.loose,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                ' ' +
                                    _data['category']
                                        .toUpperCase() +
                                    ' ',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  backgroundColor: Colors.green,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  fontFamily: 'Oswald',
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              radius: 10,

                              backgroundColor: Colors.green,
                              //radius: 30,
                              child: Container(
                                //color: Colors.red,
                                child: Icon(
                                  Icons.apartment,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ) // residence
                          : _data['category'] == 'Autres'
                          ? Row(
                        children: [
                          Flexible(
                            flex: 4,
                            fit: FlexFit.loose,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                ' ' +
                                    _data['category']
                                        .toUpperCase() +
                                    ' ',
                                overflow:
                                TextOverflow.ellipsis,
                                style: const TextStyle(
                                  backgroundColor:
                                  Colors.deepPurple,
                                  color: Colors.white,
                                  fontWeight:
                                  FontWeight.normal,
                                  fontSize: 12,
                                  fontFamily: 'Oswald',
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              radius: 10,

                              backgroundColor:
                              Colors.deepPurple,
                              //radius: 30,
                              child: Container(
                                //color: Colors.red,
                                child: Icon(
                                  Icons.category,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ) // autres
                          : Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor:
                                Colors.black54,
                                //radius: 30,
                                child: Container(
                                  //color: Colors.red,
                                  child: Icon(
                                    Icons.attach_money,
                                    color: Colors.amber,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ) // sponsors
                  ), // category
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: ListTile(
                      dense: true,
                      title: Text(
                        _data['item'].toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          fontFamily: 'Oswald',
                        ),
                      ),
                      subtitle: Text(
                        _data['code'].toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.amber,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        _data['price'].toUpperCase() + '.00 DZD',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ),
                  ), // price
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        _data['likes'].toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ),
                  ), // likes
                  const Icon(
                    Icons.favorite,
                    color: Colors.blue,
                    size: 14.0,
                  ), // icon hearth
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

