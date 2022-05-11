import 'dart:async';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:shimmer/shimmer.dart';

import 'Fav.dart';
import 'main.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return _imageURLs();
  }
}

class _imageURLs extends StatefulWidget {
  @override
  _imageURLsState createState() => _imageURLsState();
}

bool _enabled = true;

class _imageURLsState extends State<_imageURLs> {
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

//
// final Stream<QuerySnapshot> _GridListStream = FirebaseFirestore.instance
//       .collection('Products')
//       .orderBy('time', descending: true)
//       .snapshots(includeMetadataChanges: true);
//
//
//   final Stream<QuerySnapshot> _TopHotelData = FirebaseFirestore.instance
//       .collection('Products')
//       .where('category', isEqualTo: 'Hotel')
//       .limit(3)
//       .snapshots(includeMetadataChanges: true);
//
//   final Stream<QuerySnapshot> _TopResidenceData = FirebaseFirestore.instance
//       .collection('Products')
//       .where('category', isEqualTo: 'Residence')
//       .limit(4)
//       .snapshots(includeMetadataChanges: true);
//
//   final Stream<QuerySnapshot> _TopAgenceData = FirebaseFirestore.instance
//       .collection('Products')
//       .where('category', isEqualTo: 'Agence')
//       .limit(3)
//       .snapshots(includeMetadataChanges: true);
//
//   final Stream<QuerySnapshot> _TopSponsorData = FirebaseFirestore.instance
//       .collection('Products')
//       .where('category', isEqualTo: 'Others')
//       .limit(5)
//       .snapshots(includeMetadataChanges: true);
//
//
//   final Future<QuerySnapshot<Map<String, dynamic>>> _sliderShot = FirebaseFirestore
//       .instance
//       .collection('Products')
//       .where('item', isEqualTo: 'ramzi')
//       .get();
//   getProducts() async {
//     Future<QuerySnapshot> _GridListTotal = FirebaseFirestore.instance
//         .collection('Products')
//         .orderBy('time', descending: true)
//         .limit(6)
//         .get();
//   }
//  @override
//   void initState() {
//     super.initState();
//     uploadRandom();
//   }

  int _index = 0;

  int _dataLength = 1;

  Future<void> _refreshAll(BuildContext context) async {
    return fetchGlobalListe();
  }

  Future<Null> fetchGlobalListe() async {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => MyStatefulWidget(),
            transitionDuration: Duration(seconds: 0)));
  }

  Future<QuerySnapshot> _GridListTotal = FirebaseFirestore.instance
      .collection('Products')
      .orderBy('createdAt', descending: true)
      //.limit(100)
      .get();

  void uploadRandom() async {
    final postCollection =
        FirebaseFirestore.instance.collection('Products').withConverter<Post>(
              fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
              toFirestore: (post, _) => post.toJson(),
            );
    final numbers = List.generate(100, (index) => index + 1);
    for (final number in numbers) {
      List<String> listCat = [
        'Hotel',
        'Residence',
        'Agence',
        'Autres',
        'Sponsors',
      ];
      List<String> listItem = [
        'Adams',
        'Bakerti',
        'Clark',
        'Davisco',
        'Evanessance',
        'Frank',
        'Ghoshock',
        'Hills',
        'Irwintaro',
        'Jones',
        'Kleinez',
        'Lopez',
        'Mufasa',
        'Sarabi',
        'Simba',
        'Nala',
        'Kiara',
        'Kov',
        'Timon',
        'Pumbaama',
        'Rafora',
        'Shenzi',
        'Masoulna',
        'Naltyp',
        'Ochoa',
        'Patelroota',
        'Quinncom',
        'Reilyse',
        'Smith',
        'Trott',
        'Usman',
        'Valdorcomité',
        'White',
        'Xiangshemzhen',
        'Yakub',
        'Zafarta',
      ];

      List<String> listDesc = [
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "Le président français Emmanuel Macron a assuré mardi avoir «obtenu» lors de ses discussions avec Vladimir Poutine «qu'il n'y ait pas de dégradation ni d'escalade» dans la crise russo-occidentale liée à l'Ukraine.",
        "L'organisation du Traité de l'Atlantique Nord (OTAN) est une alliance politique et militaire créée en 1949 dans le contexte de la guerre froide. Elle continue à jouer un rôle de premier plan dans le système de sécurité en Europe, même depuis la chute de l'URSS en 1991 et le délitement du Pacte de Varsovie (la contre-alliance du bloc soviétique). Ses extensions et sa relation privilégiée avec l'Ukraine sont au cœur des tensions actuelles avec la Russie. Explications en cartes.",
        "Quentin Fillon-Maillet : «Avec deux fautes au tir, je n'imaginais pas pouvoir jouer la victoire»",
        "ENQUÊTE - Faute d’avoir pu s’acquitter d’une traite faramineuse, le promoteur immobilier le plus fantasque de Los Angeles a perdu le contrôle de la gigantesque villa qu’il avait fait construire et dont il espérait tirer 500 millions de dollars. Son concepteur, ruiné, s’est exilé à Zurich.",
      ];

      var randomCat = (listCat..shuffle()).first;
      var randomDesc = (listDesc..shuffle()).first;
      var randomItem = (listItem..shuffle()).first;

      var prix = Random().nextInt(5000);
      var catego = listCat[0];
      var items = listItem[0];
      var desc = listDesc[0];

      final post = Post(
          item: '$randomItem',
          code: 'invoice$number',
          category: '$randomCat',
          price: '$prix',
          likes: '$number', //Random().nextInt(1000),
          createdAt: DateTime.now(),
          decription: '$randomDesc',
          imageUrl: 'https://source.unsplash.com/random?sig=$number',
          themb: 'https://source.unsplash.com/random?sig=$number');
      postCollection.add(post);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _refreshAll(context),
        child: SingleChildScrollView(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              //Container(
              // height: 250,
              // color: Colors.white,
              // child: Column(
              //   children: [
              // if (_dataLength != 0)
              FutureBuilder(
                future: _TopHotelFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      period: Duration(microseconds: 3000),
                      enabled: _enabled,
                      child: Container(height: 170, child: Text("Loading")),
                    );
                  }
                  return snapshot.data == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: CarouselSlider(
                              items: snapshot.data!.docs.map(
                                (DocumentSnapshot document) {
                                  Map<String, dynamic> _data =
                                      document.data()! as Map<String, dynamic>;
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
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
                                        fit: BoxFit.cover,
                                        imageUrl: _data['themb'],
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                              options: CarouselOptions(
                                viewportFraction: 1,
                                initialPage: 0,
                                autoPlay: true,
                                height: 170,
                                /*   onPageChanged: (int i,
                                        carouselPageChangedReason) {
                                      setState(() {
                                        _index = i;
                                      });
                                    }*/
                              )),
                        );
                },
                //),
              ), //Firestore Slider
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      uploadRandom();
                    });
                  },
                  child: Text('Stepper'),
                ),
              ),
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
                            return CardTopShimmer();
                          }

                          return ListView(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> _data =
                                  document.data()! as Map<String, dynamic>;
                              return CardTop(data: _data);
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ), // ListView Horizontal Filtered Top Hotel
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
                                'Top Résidence',
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
                                          text: 'Flash',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Oswald',
                                              fontSize: 18,
                                              color: Colors.green)),
                                      TextSpan(
                                          text: 'Vente',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Oswald',
                                              fontSize: 18,
                                              color: Colors.black)),
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
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder<QuerySnapshot>(
                        future: _TopResidenceFuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CardTopShimmer(); //Text("Loading");
                          }

                          return ListView(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> _data =
                                  document.data()! as Map<String, dynamic>;
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 2,
                                semanticContainer: true,
                                color: Colors.white70,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Container(
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
                                            fit: BoxFit.cover,
                                            imageUrl: _data['themb'],
                                            /*placeholder: (context, url) => Center(
                                              child: CircularProgressIndicator(),
                                            ),*/
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
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
                            }).toList(),
                          );
                        },
                      ),

                      /*ListView.builder(
                              itemCount: 20,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                    height: 100,
                                    width: 100,
                                    margin: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text('Cardrat $index'),
                                    ),
                                    color: Colors.green,
                                  )),*/
                    ),
                  ],
                ),
              ), // ListView Horizontal Filtered Top Résidence
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
                                'Top Agence',
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
                                          text: 'Best',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Oswald',
                                              fontSize: 18,
                                              color: Colors.deepPurple)),
                                      TextSpan(
                                          text: 'Choice',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Oswald',
                                              fontSize: 18,
                                              color: Colors.red)),
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
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder<QuerySnapshot>(
                        future: _TopAgenceFuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CardTopShimmer(); //Text("Loading");
                          }

                          return ListView(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> _data =
                                  document.data()! as Map<String, dynamic>;
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 2,
                                semanticContainer: true,
                                color: Colors.white70,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Container(
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
                                            fit: BoxFit.cover,
                                            imageUrl: _data['themb'],
                                            /*placeholder: (context, url) => Center(
                                              child: CircularProgressIndicator(),
                                            ),*/
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
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
                            }).toList(),
                          );
                        },
                      ),

                      /*ListView.builder(
                              itemCount: 20,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                    height: 100,
                                    width: 100,
                                    margin: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text('Cardrat $index'),
                                    ),
                                    color: Colors.green,
                                  )),*/
                    ),
                  ],
                ),
              ), // ListView Horizontal Filtered Top Agence
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 4, 0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                //width: 200.0,
                                child: DefaultTextStyle(
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.red,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 7.0,
                                        color: Colors.white,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      FlickerAnimatedText('Flicker Ramzy',
                                          textStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Oswald')),
                                      FlickerAnimatedText('Night Vibes On',
                                          textStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Oswald')),
                                      FlickerAnimatedText("C'est La Vie !",
                                          textStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Oswald')),
                                    ],
                                    onTap: () {
                                      print("Tap Event");
                                    },
                                  ),
                                ),
                              ),

                              /*Text(
                                  'Sponsorisé',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Oswald'),
                                ),*/
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 30,
                              color: Colors.black,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'Top ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Oswald',
                                                fontSize: 18,
                                                color: Colors.blue)),
                                        TextSpan(
                                            text: 'Product',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Oswald',
                                                fontSize: 18,
                                                color: Colors.yellowAccent)),
                                      ],
                                      //text: 'Aujourd\'Hui ',
                                    ),
                                  )),
                            ),
                          ),
                          /*Icon(Icons.arrow_forward_ios_sharp),*/
                          /*add_to_photos_rounded
                            arrow_forward_ios_sharp
                            arrow_right_sharp*/
                        ],
                      ),
                    ),
                    FutureBuilder<QuerySnapshot>(
                      future: _TopSponsorFuture,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: _enabled,
                            child: Container());//Text("Loading");
                        }

                        return ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> _data =
                                document.data()! as Map<String, dynamic>;
                            return Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 5,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(_data['themb']),
                                      ),
                                      /*Icon(Icons.add_a_photo_rounded),*/
                                      title: Text(
                                        _data['item'].toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          fontFamily: 'Oswald',
                                        ),
                                      ),
                                      subtitle: Text(
                                        _data['price'] + '.00 DZD',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Oswald',
                                        ),
                                      ),
                                    ),
                                    ShaderMask(
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
                                        fit: BoxFit.cover,
                                        imageUrl: _data['themb'],
                                        /*placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(),
                                  ),*/
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        'Greyhound divisively hello coldly wonderfully marginally far upon excluding.'
                                            .toUpperCase(),
                                        //overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          fontFamily: 'Oswald',
                                        ),
                                      ),
                                    ),
                                    ButtonBar(
                                      alignment: MainAxisAlignment.start,
                                      children: [
                                        FlatButton(
                                          textColor: const Color(0xFF005DFF),
                                          onPressed: () {
                                            // Perform some action
                                          },
                                          child: Text(
                                            'ACTION 1'.toUpperCase(),
                                            //overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              //color: Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily: 'Oswald',
                                            ),
                                          ),
                                        ),
                                        FlatButton(
                                          textColor: const Color(0xFFFF0000),
                                          onPressed: () {
                                            // Perform some action
                                          },
                                          child: Text(
                                            'ACTION 2'.toUpperCase(),
                                            //overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              //color: Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                              fontFamily: 'Oswald',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    /* Image.network('https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=939&q=80'),*/
                                  ],
                                ),

                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ), // ListView Horizontal Filtered Top Product
              FutureBuilder<QuerySnapshot>(
                    future: _GridListTotal,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      //print(snapshot.connectionState);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
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
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> _data =
                                  document.data()! as Map<String, dynamic>;

                              //  final List<String> images =
                              // List.from(document['urls']);
                              //
                              // List<GridTile> newGridTile = [];
                              //
                              // images.forEach((image) {
                              //   newGridTile.add(GridTile(
                              //     child: Image.network(
                              //       image,
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ));
                              // });

                              return Padding(
                                padding: const EdgeInsets.fromLTRB(6, 4, 4, 4),
                                // child: Card(
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(12),
                                //   ),
                                //   elevation: 5,
                                //   clipBehavior: Clip.antiAliasWithSaveLayer,
                                //   //color: Colors.lightBlue,
                                //   child: InkWell(
                                //     child: GridTile(
                                //       footer: Container(
                                //         // height: 60,
                                //         //color: Colors.black45,
                                //         child: ListTile(
                                //           title: Text(
                                //             _data['item'].toUpperCase(),
                                //             overflow: TextOverflow.ellipsis,
                                //             style: TextStyle(
                                //               color: Colors.white,
                                //               fontWeight: FontWeight.normal,
                                //               fontSize: 15,
                                //               fontFamily: 'Oswald',
                                //             ),
                                //           ),
                                //           subtitle: Text(
                                //             _data['price'] + '.00 DZD',
                                //             overflow: TextOverflow.ellipsis,
                                //             style: TextStyle(
                                //               color: Colors.indigoAccent,
                                //               fontWeight: FontWeight.bold,
                                //               fontSize: 17,
                                //               fontFamily: 'Oswald',
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //       child: ShaderMask(
                                //         shaderCallback: (rect) {
                                //           return LinearGradient(
                                //             begin: Alignment.topCenter,
                                //             end: Alignment.bottomCenter,
                                //             colors: [
                                //               Colors.transparent,
                                //               Colors.black
                                //             ],
                                //           ).createShader(Rect.fromLTRB(
                                //               0, 0, rect.width, rect.height));
                                //         },
                                //         blendMode: BlendMode.darken,
                                //         child: CachedNetworkImage(
                                //           imageUrl: _data['themb'],
                                //           /*placeholder: (context, url) => Center(
                                //             child: CircularProgressIndicator(),
                                //           ),*/
                                //           errorWidget: (context, url, error) =>
                                //               Icon(Icons.error),
                                //           fit: BoxFit.cover,
                                //         ),
                                //       ),
                                //
                                //       /*Image.network(
                                //           _data['themb'],
                                //           fit: BoxFit.cover,
                                //         ),*/
                                //     ),
                                //     // focusColor: Colors.deepPurple ,
                                //     onTap: () {},
                                //   ),
                                // ),CardR
                                child: CardR(data: _data),
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
      ),
    );
  }
}

class Post {
  final String item;
  final String category;
  final String code;
  final String likes;
  final String price;
  final DateTime createdAt;
  final String imageUrl;
  final String themb;
  final String decription;

  const Post({
    required this.item,
    required this.price,
    required this.category,
    required this.code,
    required this.likes,
    required this.createdAt,
    required this.imageUrl,
    required this.themb,
    required this.decription,
  });
  Post.fromJson(Map<String, Object?> json)
      : this(
          item: json['item']! as String,
          code: json['code']! as String,
          category: json['category']! as String,
          likes: json['likes']! as String,
          price: json['price']! as String,
          createdAt: (json['createdAt']! as Timestamp).toDate(),
          decription: json['Description']! as String,
          imageUrl: json['imageUrl']! as String,
          themb: json['themb']! as String,
        );
  Map<String, Object?> toJson() => {
        'likes': likes,
        'createdAt': createdAt,
        'imageUrl': imageUrl,
        'themb': themb,
        "item": item,
        'code': code,
        'price': price, // + '.00 dzd ',
        'category': category,
        'Description': decription,
      };
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
                      /*placeholder: (context, url) => Center(
                                              child: CircularProgressIndicator(),
                                            ),*/
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ), // image
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 05, 05, 0),
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
                                      child: Icon(
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
                                            // Expanded(
                                            //   flex: 3,
                                            //   child: Text(
                                            //     _data['category'].toUpperCase(),
                                            //     overflow: TextOverflow.ellipsis,
                                            //     style: const TextStyle(
                                            //       backgroundColor: Colors.black,
                                            //       color: Colors.amber,
                                            //       fontWeight: FontWeight.normal,
                                            //       fontSize: 15,
                                            //       fontFamily: 'Oswald',
                                            //     ),
                                            //   ),
                                            // ),
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
                      // leading: Icon(
                      //       Icons.attach_money,
                      //       color: Colors.amber,
                      //     ),

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
                  // item & code
                  // Container(
                  //   padding: EdgeInsets.fromLTRB(4, 12, 0, 0),
                  //   alignment: Alignment.bottomLeft,
                  //   child: Text(
                  //     _data['Description'].toUpperCase(),
                  //     overflow: TextOverflow.ellipsis,
                  //     style: const TextStyle(
                  //       color: Colors.blue,
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 12,
                  //       fontFamily: 'Oswald',
                  //     ),
                  //   ),
                  // ), // description
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

  // switchWithMonth() {
  //   switch (_data['category']) {
  //     case 'Hotel':
  //       Text(
  //         _data['category'].toUpperCase(),
  //         overflow: TextOverflow.ellipsis,
  //         style: const TextStyle(
  //           backgroundColor: Colors.blue,
  //           color: Colors.white,
  //           fontWeight: FontWeight.normal,
  //           fontSize: 15,
  //           fontFamily: 'Oswald',
  //         ),
  //       );
  //       break;
  //     case 'Residence':
  //       Text(
  //         _data['category'].toUpperCase(),
  //         overflow: TextOverflow.ellipsis,
  //         style: const TextStyle(
  //           backgroundColor: Colors.red,
  //           color: Colors.white,
  //           fontWeight: FontWeight.normal,
  //           fontSize: 15,
  //           fontFamily: 'Oswald',
  //         ),
  //       );
  //       break;
  //     case 'Agence':
  //       Text(
  //         _data['category'].toUpperCase(),
  //         overflow: TextOverflow.ellipsis,
  //         style: const TextStyle(
  //           backgroundColor: Colors.green,
  //           color: Colors.white,
  //           fontWeight: FontWeight.normal,
  //           fontSize: 15,
  //           fontFamily: 'Oswald',
  //         ),
  //       );
  //       break;
  //     case 'Autres':
  //       Text(
  //         _data['category'].toUpperCase(),
  //         overflow: TextOverflow.ellipsis,
  //         style: const TextStyle(
  //           backgroundColor: Colors.amber,
  //           color: Colors.white,
  //           fontWeight: FontWeight.normal,
  //           fontSize: 15,
  //           fontFamily: 'Oswald',
  //         ),
  //       );
  //       break;
  //
  //     case 'Sponsors':
  //       Text(
  //         _data['category'].toUpperCase(),
  //         overflow: TextOverflow.ellipsis,
  //         style: const TextStyle(
  //           backgroundColor: Colors.black,
  //           color: Colors.white,
  //           fontWeight: FontWeight.normal,
  //           fontSize: 15,
  //           fontFamily: 'Oswald',
  //         ),
  //       );
  //       break;
  //     default:
  //       Text(
  //         _data['category'].toUpperCase(),
  //         overflow: TextOverflow.ellipsis,
  //         style: const TextStyle(
  //           backgroundColor: Colors.blue,
  //           color: Colors.white,
  //           fontWeight: FontWeight.normal,
  //           fontSize: 15,
  //           fontFamily: 'Oswald',
  //         ),
  //       );
  //   }
  // }
}

class CardTop extends StatelessWidget {
  const CardTop({
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
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
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
                      /*placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),*/
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ), // image
                  // Container(
                  //   padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  //   alignment: Alignment.topLeft,
                  //   child: _data['category'] == 'Hotel'
                  //       ? Text(
                  //           _data['category'].toUpperCase(),
                  //           overflow: TextOverflow.ellipsis,
                  //           style: const TextStyle(
                  //             backgroundColor: Colors.blue,
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.normal,
                  //             fontSize: 15,
                  //             fontFamily: 'Oswald',
                  //           ),
                  //         )
                  //       : Text(
                  //           _data['category'].toUpperCase(),
                  //           overflow: TextOverflow.ellipsis,
                  //           style: const TextStyle(
                  //             backgroundColor: Colors.red,
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.normal,
                  //             fontSize: 15,
                  //             fontFamily: 'Oswald',
                  //           ),
                  //         ),
                  // ), // category
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: ListTile(
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
                  ), // item & code
                  // Container(
                  //   padding: EdgeInsets.fromLTRB(4, 12, 0, 0),
                  //   alignment: Alignment.bottomLeft,
                  //   child: Text(
                  //     _data['Description'].toUpperCase(),
                  //     overflow: TextOverflow.ellipsis,
                  //     style: const TextStyle(
                  //       color: Colors.blue,
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 12,
                  //       fontFamily: 'Oswald',
                  //     ),
                  //   ),
                  // ), // description
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardTopShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: _enabled,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            semanticContainer: true,
            //color: Colors.white70,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.30,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(),
                        Container(),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: _enabled,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            semanticContainer: true,
            //color: Colors.white70,
            child: Container(
              height: MediaQuery.of(context).size.width * 0.15,
              width: MediaQuery.of(context).size.width * 0.30,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(),
                        Container(),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          //period: Duration(milliseconds: 3000),
          enabled: _enabled,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            semanticContainer: true,
            //color: Colors.white70,
            child: Container(
              height: MediaQuery.of(context).size.width * 0.15,
              width: MediaQuery.of(context).size.width * 0.30,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(),
                        Container(),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: _enabled,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            semanticContainer: true,
            //color: Colors.white70,
            child: Container(
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
