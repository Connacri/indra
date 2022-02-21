import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indra/home.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:shimmer/shimmer.dart';

class CardStateLess extends StatefulWidget {
  const CardStateLess({Key? key}) : super(key: key);

  @override
  _CardStateLessState createState() => _CardStateLessState();
}

class _CardStateLessState extends State<CardStateLess> {
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

  final Future<DocumentSnapshot> _top =
      FirebaseFirestore.instance.collection('Products').doc('h1').get();

  //
  // static const String? documentTop = 'Products';
  // static const String? collectionRMZ = '0I2yqNMQcdRXVFaNpmFQ';

  // Future<QuerySnapshot> _top = FirebaseFirestore.instance
  //     .collection('Products')
  //     .doc('h1').get() as Future<QuerySnapshot<Object?>>;

  @override
  Widget build(BuildContext context) {
    String collectionRMZ = 'Products';
    String documentTop = 'h1';

    return Scaffold(
      body: PaginateFirestore(
        header: SliverToBoxAdapter(
          child: ListView(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              //Container(
              // height: 250,
              // color: Colors.white,
              // child: Column(
              //   children: [
              // if (_dataLength != 0)
              Slider(
                  TopHotelFuture: _TopHotelFuture,
                  enabled: _enabled), //Firestore Slider
              Top_Hotel(TopHotelFuture: _TopHotelFuture),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  //direction: Axis.horizontal,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Top H1",
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        H1(
                            collectionRMZ: 'Products',
                            documentTop: '0NGzux0acnV2BLxL9gmm'),
                        H1(
                            collectionRMZ: 'Products',
                            documentTop: '0idCvPmkwjA62I6c4oXf'),
                        H1(
                            collectionRMZ: collectionRMZ,
                            documentTop: '0rdOoxlkXZeRFUeUjvwN'),
                        H1(
                            collectionRMZ: 'Products',
                            documentTop: '1msxehqQGPgMnYYZ6CZt'),
                        H1(
                            collectionRMZ: collectionRMZ,
                            documentTop: '1xoDybmqFyeUgsMTDggn'),
                      ],
                    )
                  ],
                ),
              ),
              Wrap(
                //direction: Axis.horizontal,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Top Résidences",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Card(
                          color: Colors.lightBlue,
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              height: 90,
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          color: Colors.lightBlue,
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              height: 90,
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          color: Colors.lightBlue,
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              height: 90,
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Top_Title(
                        toptitle: 'Top Résidence',
                        toptitle2: 'Flash',
                        CustomColorSpan: Colors.green,
                        toptitle3: 'Vente',
                        CustomColorSpan2: Colors.black,
                        CustomIcon: Icons.arrow_forward_ios_sharp),
                    TopWidget(TopFuture: _TopResidenceFuture),
                  ],
                ),
              ), // ListView Horizontal Filtered Top Résidence
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Top_Title(
                        toptitle: 'Top Agence',
                        toptitle2: 'Best',
                        CustomColorSpan: Colors.deepPurple,
                        toptitle3: 'Choice',
                        CustomColorSpan2: Colors.red,
                        CustomIcon: Icons.arrow_forward_ios_sharp),
                    TopWidget(TopFuture: _TopAgenceFuture),
                  ],
                ),
              ), // ListView Horizontal Filtered Top Agence
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(8, 0, 4, 0),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         flex: 1,
                    //         child: Align(
                    //           alignment: Alignment.bottomLeft,
                    //           child: SizedBox(
                    //             //width: 200.0,
                    //             child: DefaultTextStyle(
                    //               style: TextStyle(
                    //                 fontSize: 35,
                    //                 color: Colors.red,
                    //                 shadows: [
                    //                   Shadow(
                    //                     blurRadius: 7.0,
                    //                     color: Colors.white,
                    //                     offset: Offset(0, 0),
                    //                   ),
                    //                 ],
                    //               ),
                    //               child: AnimatedTextKit(
                    //                 repeatForever: true,
                    //                 animatedTexts: [
                    //                   FlickerAnimatedText('Flicker Ramzy',
                    //                       textStyle: TextStyle(
                    //                           fontSize: 18,
                    //                           fontWeight: FontWeight.normal,
                    //                           fontFamily: 'Oswald')),
                    //                   FlickerAnimatedText('Night Vibes On',
                    //                       textStyle: TextStyle(
                    //                           fontSize: 18,
                    //                           fontWeight: FontWeight.normal,
                    //                           fontFamily: 'Oswald')),
                    //                   FlickerAnimatedText("C'est La Vie !",
                    //                       textStyle: TextStyle(
                    //                           fontSize: 18,
                    //                           fontWeight: FontWeight.normal,
                    //                           fontFamily: 'Oswald')),
                    //                 ],
                    //                 onTap: () {
                    //                   print("Tap Event");
                    //                 },
                    //               ),
                    //             ),
                    //           ),
                    //
                    //           /*Text(
                    //               'Sponsorisé',
                    //               style: TextStyle(
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.normal,
                    //                   fontFamily: 'Oswald'),
                    //             ),*/
                    //         ),
                    //       ),
                    //       Expanded(
                    //         flex: 1,
                    //         child: Container(
                    //           height: 30,
                    //           color: Colors.black,
                    //           child: Align(
                    //               alignment: Alignment.center,
                    //               child: RichText(
                    //                 textAlign: TextAlign.start,
                    //                 text: TextSpan(
                    //                   style: DefaultTextStyle.of(context).style,
                    //                   children: const <TextSpan>[
                    //                     TextSpan(
                    //                         text: 'Top ',
                    //                         style: TextStyle(
                    //                             fontWeight: FontWeight.bold,
                    //                             fontFamily: 'Oswald',
                    //                             fontSize: 18,
                    //                             color: Colors.blue)),
                    //                     TextSpan(
                    //                         text: 'Product',
                    //                         style: TextStyle(
                    //                             fontWeight: FontWeight.bold,
                    //                             fontFamily: 'Oswald',
                    //                             fontSize: 18,
                    //                             color: Colors.yellowAccent)),
                    //                   ],
                    //                   //text: 'Aujourd\'Hui ',
                    //                 ),
                    //               )),
                    //         ),
                    //       ),
                    //       /*Icon(Icons.arrow_forward_ios_sharp),*/
                    //       /*add_to_photos_rounded
                    //         arrow_forward_ios_sharp
                    //         arrow_right_sharp*/
                    //     ],
                    //   ),
                    // ),
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
        bottomLoader: Text(''),

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
        itemsPerPage: 20,
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
          print(_data!.length);
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
                      child: Cardless(data: _data),
                    ),
                  ),
                );
        },
      ),
    );
  }

  Card buildCardDetail(Map<dynamic, dynamic> _data) {
    return Card(
      child: Column(
        children: [
          Expanded(
            flex: 6,
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
                    padding: const EdgeInsets.fromLTRB(0, 35, 15, 0),
                    //alignment: Alignment.topLeft,
                    child: _data['category'] == 'Hotel'
                        ? CategoryColors(
                            _data, Colors.blue, Colors.white, Icons.hotel)
                        : _data['category'] == 'Agence'
                            ? CategoryColors(_data, Colors.red, Colors.white,
                                Icons.account_balance)
                            : _data['category'] == 'Residence'
                                ? CategoryColors(_data, Colors.green,
                                    Colors.white, Icons.apartment)
                                : _data['category'] == 'Autres'
                                    ? CategoryColors(_data, Colors.deepPurple,
                                        Colors.white, Icons.category)
                                    : CategoryColors(_data, Colors.black54,
                                        Colors.amber, Icons.attach_money)

                    // sponsors
                    ), // category

                Container(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    dense: true,
                    leading: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: _data['themb'],
                      placeholder: (context, url) => Center(
                          //child: CircularProgressIndicator(),
                          ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    title: Text(
                      _data['item'].toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                        fontFamily: 'Oswald',
                      ),
                    ),
                    subtitle: Text(
                      _data['code'].toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
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
                          fontSize: 16,
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
                            fontSize: 14,
                            fontFamily: 'Oswald',
                          ),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.blue,
                          size: 16.0,
                        ), // icon hearth
                      ],
                    ),
                  ), // likes
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  _data['createdAt'].toDate().toString(),
                  //overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    fontFamily: 'Oswald',
                  ),
                ),
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
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    fontFamily: 'Oswald',
                  ),
                ),
              ),
            ),
          ), // Description
        ],
      ),
    );
  }

  Row CategoryColors(Map<dynamic, dynamic> _data, customColor, customColor2,
      IconData? customIcon) {
    return Row(
      children: [
        Flexible(
          flex: 4,
          fit: FlexFit.loose,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' ' + _data['category'].toUpperCase() + ' ',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                backgroundColor: customColor, //Colors.blue,
                color: customColor2,
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
            backgroundColor: customColor,
            //radius: 30,
            child: Container(
              child: Icon(
                customIcon, //Icons.hotel,
                color: customColor2,
                size: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class H1 extends StatelessWidget {
  const H1({
    Key? key,
    required this.collectionRMZ,
    required this.documentTop,
  }) : super(key: key);

  final String collectionRMZ;
  final String documentTop;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection(collectionRMZ)
            .doc(documentTop)
            .get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // final _img = snapshot.data['themb'];
          // print(_img);

          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CardTopShimmer(); //Text("Loading");
          }

          return InkWell(
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
                            ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height));
                          },
                          blendMode: BlendMode.darken,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: snapshot.data['themb'], //_img,
                            /*placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),*/
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        //height: 60,
                        //color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),

      // Expanded(
      //   flex: 1,
      //   child: Card(
      //     color: Colors.lightBlue,
      //     elevation: 5,
      //     child: Padding(
      //       padding: EdgeInsets.only(left: 5, right: 5),
      //       child: Container(
      //         height: 90,
      //         width: 150,
      //       ),
      //     ),
      //   ),
      // ),
      // Expanded(
      //   flex: 1,
      //   child: Card(
      //     color: Colors.lightBlue,
      //     elevation: 5,
      //     child: Padding(
      //       padding: EdgeInsets.only(left: 5, right: 5),
      //       child: Container(
      //         height: 90,
      //         width: 150,
      //       ),
      //     ),
      //   ),
      // ),
      // Expanded(
      //   flex: 1,
      //   child: Card(
      //     color: Colors.lightBlue,
      //     elevation: 5,
      //     child: Padding(
      //       padding: EdgeInsets.only(left: 5, right: 5),
      //       child: Container(
      //         height: 90,
      //         width: 150,
      //       ),
      //     ),
      //   ),
      // ),
      // Expanded(
      //   flex: 1,
      //   child: Card(
      //     color: Colors.lightBlue,
      //     elevation: 5,
      //     child: Padding(
      //       padding: EdgeInsets.only(left: 5, right: 5),
      //       child: Container(
      //         height: 90,
      //         width: 150,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
    required Future<QuerySnapshot<Object?>> TopFuture,
  })  : _TopResidenceFuture = TopFuture,
        super(key: key);

  final Future<QuerySnapshot<Object?>> _TopResidenceFuture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<QuerySnapshot>(
        future: _TopResidenceFuture,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CardTopShimmer(); //Text("Loading");
          }

          return ListView(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> _data =
                  document.data()! as Map<String, dynamic>;
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
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
    );
  }
}

class Top_Title extends StatelessWidget {
  const Top_Title({
    Key? key,
    required this.toptitle,
    required this.toptitle2,
    required this.CustomColorSpan,
    required this.toptitle3,
    required this.CustomColorSpan2,
    required this.CustomIcon,
  }) : super(key: key);

  final toptitle;
  final toptitle2;
  final CustomColorSpan;
  final toptitle3;
  final CustomColorSpan2;
  final IconData? CustomIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                toptitle,
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
                    children: <TextSpan>[
                      TextSpan(
                          text: toptitle2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Oswald',
                              fontSize: 18,
                              color: CustomColorSpan)),
                      TextSpan(
                          text: toptitle3,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Oswald',
                              fontSize: 18,
                              color: CustomColorSpan2)),
                    ],
                    //text: 'Aujourd\'Hui ',
                  ),
                )),
          ),
          Icon(CustomIcon),
          /*add_to_photos_rounded
            arrow_forward_ios_sharp
            arrow_right_sharp*/
        ],
      ),
    );
  }
}

class Top_Hotel extends StatelessWidget {
  const Top_Hotel({
    Key? key,
    required Future<QuerySnapshot<Object?>> TopHotelFuture,
  })  : _TopHotelFuture = TopHotelFuture,
        super(key: key);

  final Future<QuerySnapshot<Object?>> _TopHotelFuture;

  @override
  Widget build(BuildContext context) {
    return Padding(
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

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CardTopShimmer();
                }

                return ListView(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> _data =
                        document.data()! as Map<String, dynamic>;
                    return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return CardTop(data: _data);
                          }));
                        },
                        child:
                            Hero(tag: 'detail', child: CardTop(data: _data)));
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Slider extends StatelessWidget {
  const Slider({
    Key? key,
    required Future<QuerySnapshot<Object?>> TopHotelFuture,
    required bool enabled,
  })  : _TopHotelFuture = TopHotelFuture,
        _enabled = enabled,
        super(key: key);

  final Future<QuerySnapshot<Object?>> _TopHotelFuture;
  final bool _enabled;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _TopHotelFuture,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                colors: [Colors.transparent, Colors.black],
                              ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height));
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
    );
  }
}

class Cardless extends StatelessWidget {
  const Cardless({
    Key? key,
    required Map? data,
  })  : _data = data,
        super(key: key);

  final Map? _data;

  @override
  Widget build(BuildContext context) {
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
                      imageUrl: _data!['themb'],
                    ),
                  ), // image
                  Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 05, 0),
                      //alignment: Alignment.topLeft,
                      child: _data!['category'] == 'Hotel'
                          ? CategoryColors(
                              _data!, Colors.blue, Colors.white, Icons.hotel)
                          : _data!['category'] == 'Agence'
                              ? CategoryColors(_data!, Colors.red, Colors.white,
                                  Icons.account_balance)
                              : _data!['category'] == 'Residence'
                                  ? CategoryColors(_data!, Colors.green,
                                      Colors.white, Icons.apartment)
                                  : _data!['category'] == 'Autres'
                                      ? CategoryColors(
                                          _data!,
                                          Colors.deepPurple,
                                          Colors.white,
                                          Icons.category)
                                      : CategoryColors(_data!, Colors.black54,
                                          Colors.amber, Icons.attach_money)

                      // sponsors
                      ), // category
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: ListTile(
                      dense: true,
                      title: Text(
                        _data!['item'].toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          fontFamily: 'Oswald',
                        ),
                      ),
                      subtitle: Text(
                        _data!['code'].toUpperCase(),
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
                        _data!['price'].toUpperCase() + '.00 DZD',
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
                        _data!['likes'].toUpperCase(),
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

  Row CategoryColors(Map<dynamic, dynamic> _data, customColor, customColor2,
      IconData? customIcon) {
    return Row(
      children: [
        Flexible(
          flex: 4,
          fit: FlexFit.loose,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' ' + _data['category'].toUpperCase() + ' ',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                backgroundColor: customColor, //Colors.blue,
                color: customColor2,
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
            backgroundColor: customColor,
            //radius: 30,
            child: Container(
              child: Icon(
                customIcon, //Icons.hotel,
                color: customColor2,
                size: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
