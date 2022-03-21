import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indra/Authentification/Test.dart';
import 'package:indra/Authentification/main.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:shimmer/shimmer.dart';
import 'home.dart';

class conbb extends StatefulWidget {
  const conbb({Key? key}) : super(key: key);

  @override
  _conbbState createState() => _conbbState();
}

class _conbbState extends State<conbb> {
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
        header: SliverToBoxAdapter(
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
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return CardTop(data: _data);
                                    }));
                                  },
                                  child: Hero(
                                      tag: 'detail',
                                      child: CardTop(data: _data)));
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
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return CardTop(data: _data);
                                  }));
                                },
                                child: Hero(
                                  tag: 'detail',
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    elevation: 2,
                                    semanticContainer: true,
                                    color: Colors.white70,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.15,
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
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
                                                    0,
                                                    0,
                                                    rect.width,
                                                    rect.height));
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
                              child: Container()); //Text("Loading");
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
            ],
          ),
        ),
        // footer: SliverToBoxAdapter(
        //   child: Container(
        //     child: ElevatedButton(
        //       onPressed: () {
        //         setState(() {});
        //       },
        //       child: Text('Stepper'),
        //     ),
        //   ),
        // ),
        itemsPerPage: 10,
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
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return buildCardDetail(_data);
                      }));
                    },
                    child: Hero(
                      tag: 'detail',
                      child: buildCard(_data),
                    ),
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

  Card buildCardDetail(Map<dynamic, dynamic> _data) {
    return Card(
      child: Column(
        children: [
          Expanded(
            flex:4,
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
                                    ' ' + _data['category'].toUpperCase() + ' ',
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
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  backgroundColor:
                                                      Colors.deepPurple,
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
                                                backgroundColor: Colors.black54,
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
          Expanded(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        _data['price'].toUpperCase() + '.00 DZD',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ),
                  ), // price
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        Text(
                          _data['likes'].toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: 'Oswald',
                          ),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.blue,
                          size: 14.0,
                        ), // icon hearth
                      ],
                    ),
                  ), // likes
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  _data['Description'],
                  //overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    fontFamily: 'Oswald',
                  ),
                ),
              ),
            ),
          ),// Description
        ],
      ),
    );
  }
}

