import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import '../home.dart';

class Carrouselllll extends StatefulWidget {
  const Carrouselllll({Key? key}) : super(key: key);

  @override
  _CarrouselllllState createState() => _CarrouselllllState();
}

class _CarrouselllllState extends State<Carrouselllll> {
  // Future<QuerySnapshot> _TopAgenceFuture = FirebaseFirestore.instance
  //     .collection('Products')
  //     .where('category', isEqualTo: 'Agence')
  //     .limit(3)
  //     .get();
  //
  // // final Future<QuerySnapshot> _TopHotelFuture = FirebaseFirestore.instance
  // //     .collection('Products')
  // //     .where('category', isEqualTo: 'Hotel')
  // //     .limit(3)
  // //     .get();
  //
  // Future<QuerySnapshot> _TopHotelFuture = FirebaseFirestore.instance
  //     .collection('Products')
  //     .where('category', isEqualTo: 'Hotel')
  //     .limit(3)
  //     .get();
  //
  // Future<QuerySnapshot> _TopResidenceFuture = FirebaseFirestore.instance
  //     .collection('Products')
  //     .where('category', isEqualTo: 'Residence')
  //     .limit(3)
  //     .get();
  //
  // Future<QuerySnapshot> _TopSponsorFuture = FirebaseFirestore.instance
  //     .collection('Products')
  //     .where('category', isEqualTo: 'Autres')
  //     .limit(3)
  //     .get();
  //
  // final Future<QuerySnapshot> _GridListTotal = FirebaseFirestore.instance
  //     .collection('Products')
  //     .orderBy('createdAt', descending: true)
  //     //.limit(10)
  //     .get();
  //
  // int _index = 0;
  //
  // int _dataLength = 1;


//ramzy
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         // height: 250,
      //         color: Colors.white,
      //         child: Column(
      //           children: [
      //             if (_dataLength != 0)
      //               FutureBuilder(
      //                 future: _TopHotelFuture,
      //                 builder: (BuildContext context,
      //                     AsyncSnapshot<QuerySnapshot> snapshot) {
      //                   if (snapshot.hasError) {
      //                     return Text('Something went wrong');
      //                   }
      //
      //                   if (snapshot.connectionState ==
      //                       ConnectionState.waiting) {
      //                     return Text("Loading");
      //                   }
      //                   return snapshot.data == null
      //                       ? Center(
      //                           child: CircularProgressIndicator(),
      //                         )
      //                       : Padding(
      //                           padding: const EdgeInsets.only(top: 0),
      //                           child: CarouselSlider(
      //                               items: snapshot.data!.docs.map(
      //                                 (DocumentSnapshot document) {
      //                                   Map<String, dynamic> _data = document
      //                                       .data()! as Map<String, dynamic>;
      //                                   return SizedBox(
      //                                     width:
      //                                         MediaQuery.of(context).size.width,
      //                                     child: ShaderMask(
      //                                       shaderCallback: (rect) {
      //                                         return LinearGradient(
      //                                           begin: Alignment.topCenter,
      //                                           end: Alignment.bottomCenter,
      //                                           colors: [
      //                                             Colors.transparent,
      //                                             Colors.black
      //                                           ],
      //                                         ).createShader(Rect.fromLTRB(0, 0,
      //                                             rect.width, rect.height));
      //                                       },
      //                                       blendMode: BlendMode.darken,
      //                                       child: CachedNetworkImage(
      //                                         fit: BoxFit.cover,
      //                                         imageUrl: _data['themb'],
      //                                       ),
      //                                     ),
      //                                   );
      //                                 },
      //                               ).toList(),
      //                               options: CarouselOptions(
      //                                 viewportFraction: 1,
      //                                 initialPage: 0,
      //                                 autoPlay: true,
      //                                 height: 170,
      //                                 /*   onPageChanged: (int i,
      //                                   carouselPageChangedReason) {
      //                                 setState(() {
      //                                   _index = i;
      //                                 });
      //                               }*/
      //                               )),
      //                         );
      //                 },
      //               ),
      //           ],
      //         ),
      //       ), //Firestore Slider
      //       Container(
      //         child: ElevatedButton(
      //           onPressed: () {
      //             setState(() {
      //               uploadRandom();
      //             });
      //           },
      //           child: Text('Stepper'),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Column(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      //               child: Row(
      //                 children: [
      //                   Expanded(
      //                     flex: 1,
      //                     child: Align(
      //                       alignment: Alignment.bottomLeft,
      //                       child: Text(
      //                         'Top Hôtel',
      //                         style: TextStyle(
      //                             fontSize: 18,
      //                             fontWeight: FontWeight.normal,
      //                             fontFamily: 'Oswald'),
      //                       ),
      //                     ),
      //                   ),
      //                   Expanded(
      //                     flex: 1,
      //                     child: Align(
      //                         alignment: Alignment.bottomRight,
      //                         child: RichText(
      //                           text: TextSpan(
      //                             style: DefaultTextStyle.of(context).style,
      //                             children: const <TextSpan>[
      //                               TextSpan(
      //                                   text: 'Super',
      //                                   style: TextStyle(
      //                                       fontWeight: FontWeight.bold,
      //                                       fontFamily: 'Oswald',
      //                                       fontSize: 18,
      //                                       color: Colors.red)),
      //                               TextSpan(
      //                                   text: 'Deals',
      //                                   style: TextStyle(
      //                                       fontWeight: FontWeight.bold,
      //                                       fontFamily: 'Oswald',
      //                                       fontSize: 18,
      //                                       color: Colors.blue)),
      //                             ],
      //                             //text: 'Aujourd\'Hui ',
      //                           ),
      //                         )),
      //                   ),
      //                   Icon(Icons.arrow_forward_ios_sharp),
      //                   /*add_to_photos_rounded
      //                       arrow_forward_ios_sharp
      //                       arrow_right_sharp*/
      //                 ],
      //               ),
      //             ),
      //             SizedBox(
      //               height: MediaQuery.of(context).size.height * 0.25,
      //               width: MediaQuery.of(context).size.width,
      //               child: FutureBuilder<QuerySnapshot>(
      //                 future: _TopHotelFuture,
      //                 builder: (BuildContext context,
      //                     AsyncSnapshot<QuerySnapshot> snapshot) {
      //                   if (snapshot.hasError) {
      //                     return Text('Something went wrong');
      //                   }
      //
      //                   if (snapshot.connectionState ==
      //                       ConnectionState.waiting) {
      //                     return Text("Loading");
      //                   }
      //
      //                   return ListView(
      //                     scrollDirection: Axis.horizontal,
      //                     physics: NeverScrollableScrollPhysics(),
      //                     children: snapshot.data!.docs
      //                         .map((DocumentSnapshot document) {
      //                       Map<String, dynamic> _data =
      //                           document.data()! as Map<String, dynamic>;
      //                       return CardR(data: _data);
      //                     }).toList(),
      //                   );
      //                 },
      //               ),
      //             ),
      //           ],
      //         ),
      //       ), // ListView Horizontal Filtered Top Hotel
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Column(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      //               child: Row(
      //                 children: [
      //                   Expanded(
      //                     flex: 1,
      //                     child: Align(
      //                       alignment: Alignment.bottomLeft,
      //                       child: Text(
      //                         'Top Résidence',
      //                         style: TextStyle(
      //                             fontSize: 18,
      //                             fontWeight: FontWeight.normal,
      //                             fontFamily: 'Oswald'),
      //                       ),
      //                     ),
      //                   ),
      //                   Expanded(
      //                     flex: 1,
      //                     child: Align(
      //                         alignment: Alignment.bottomRight,
      //                         child: RichText(
      //                           text: TextSpan(
      //                             style: DefaultTextStyle.of(context).style,
      //                             children: const <TextSpan>[
      //                               TextSpan(
      //                                   text: 'Flash',
      //                                   style: TextStyle(
      //                                       fontWeight: FontWeight.bold,
      //                                       fontFamily: 'Oswald',
      //                                       fontSize: 18,
      //                                       color: Colors.green)),
      //                               TextSpan(
      //                                   text: 'Vente',
      //                                   style: TextStyle(
      //                                       fontWeight: FontWeight.bold,
      //                                       fontFamily: 'Oswald',
      //                                       fontSize: 18,
      //                                       color: Colors.black)),
      //                             ],
      //                             //text: 'Aujourd\'Hui ',
      //                           ),
      //                         )),
      //                   ),
      //                   Icon(Icons.arrow_forward_ios_sharp),
      //                   /*add_to_photos_rounded
      //                       arrow_forward_ios_sharp
      //                       arrow_right_sharp*/
      //                 ],
      //               ),
      //             ),
      //             SizedBox(
      //               height: MediaQuery.of(context).size.height * 0.15,
      //               width: MediaQuery.of(context).size.width,
      //               child: FutureBuilder<QuerySnapshot>(
      //                 future: _TopResidenceFuture,
      //                 builder: (BuildContext context,
      //                     AsyncSnapshot<QuerySnapshot> snapshot) {
      //                   if (snapshot.hasError) {
      //                     return Text('Something went wrong');
      //                   }
      //
      //                   if (snapshot.connectionState ==
      //                       ConnectionState.waiting) {
      //                     return Text("Loading");
      //                   }
      //
      //                   return ListView(
      //                     scrollDirection: Axis.horizontal,
      //                     physics: NeverScrollableScrollPhysics(),
      //                     children: snapshot.data!.docs
      //                         .map((DocumentSnapshot document) {
      //                       Map<String, dynamic> _data =
      //                           document.data()! as Map<String, dynamic>;
      //                       return Card(
      //                         shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(6),
      //                         ),
      //                         clipBehavior: Clip.antiAliasWithSaveLayer,
      //                         elevation: 2,
      //                         semanticContainer: true,
      //                         color: Colors.white70,
      //                         child: Container(
      //                           height:
      //                               MediaQuery.of(context).size.width * 0.15,
      //                           width: MediaQuery.of(context).size.width * 0.30,
      //                           child: Stack(
      //                             fit: StackFit.expand,
      //                             children: [
      //                               Container(
      //                                 child: ShaderMask(
      //                                   shaderCallback: (rect) {
      //                                     return LinearGradient(
      //                                       begin: Alignment.topCenter,
      //                                       end: Alignment.bottomCenter,
      //                                       colors: [
      //                                         Colors.transparent,
      //                                         Colors.black
      //                                       ],
      //                                     ).createShader(Rect.fromLTRB(
      //                                         0, 0, rect.width, rect.height));
      //                                   },
      //                                   blendMode: BlendMode.darken,
      //                                   child: CachedNetworkImage(
      //                                     fit: BoxFit.cover,
      //                                     imageUrl: _data['themb'],
      //                                     /*placeholder: (context, url) => Center(
      //                                         child: CircularProgressIndicator(),
      //                                       ),*/
      //                                     errorWidget: (context, url, error) =>
      //                                         Icon(Icons.error),
      //                                   ),
      //                                 ),
      //                               ),
      //                               Container(
      //                                 alignment: Alignment.bottomCenter,
      //                                 //height: 60,
      //                                 //color: Colors.black45,
      //
      //                                 child: ListTile(
      //                                   title: Text(
      //                                     _data['item'].toUpperCase(),
      //                                     overflow: TextOverflow.ellipsis,
      //                                     style: TextStyle(
      //                                       color: Colors.white,
      //                                       fontWeight: FontWeight.normal,
      //                                       fontSize: 12,
      //                                       fontFamily: 'Oswald',
      //                                     ),
      //                                   ),
      //                                   subtitle: Text(
      //                                     _data['price'] + '.00 DZD',
      //                                     overflow: TextOverflow.ellipsis,
      //                                     style: TextStyle(
      //                                       color: Colors.redAccent,
      //                                       fontWeight: FontWeight.bold,
      //                                       fontSize: 12,
      //                                       fontFamily: 'Oswald',
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       );
      //                     }).toList(),
      //                   );
      //                 },
      //               ),
      //
      //               /*ListView.builder(
      //                         itemCount: 20,
      //                         scrollDirection: Axis.horizontal,
      //                         itemBuilder: (context, index) => Container(
      //                               height: 100,
      //                               width: 100,
      //                               margin: EdgeInsets.all(10),
      //                               child: Center(
      //                                 child: Text('Cardrat $index'),
      //                               ),
      //                               color: Colors.green,
      //                             )),*/
      //             ),
      //           ],
      //         ),
      //       ), // ListView Horizontal Filtered Top Résidence
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Column(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      //               child: Row(
      //                 children: [
      //                   Expanded(
      //                     flex: 1,
      //                     child: Align(
      //                       alignment: Alignment.bottomLeft,
      //                       child: Text(
      //                         'Top Agence',
      //                         style: TextStyle(
      //                             fontSize: 18,
      //                             fontWeight: FontWeight.normal,
      //                             fontFamily: 'Oswald'),
      //                       ),
      //                     ),
      //                   ),
      //                   Expanded(
      //                     flex: 1,
      //                     child: Align(
      //                         alignment: Alignment.bottomRight,
      //                         child: RichText(
      //                           text: TextSpan(
      //                             style: DefaultTextStyle.of(context).style,
      //                             children: const <TextSpan>[
      //                               TextSpan(
      //                                   text: 'Best',
      //                                   style: TextStyle(
      //                                       fontWeight: FontWeight.bold,
      //                                       fontFamily: 'Oswald',
      //                                       fontSize: 18,
      //                                       color: Colors.deepPurple)),
      //                               TextSpan(
      //                                   text: 'Choice',
      //                                   style: TextStyle(
      //                                       fontWeight: FontWeight.bold,
      //                                       fontFamily: 'Oswald',
      //                                       fontSize: 18,
      //                                       color: Colors.red)),
      //                             ],
      //                             //text: 'Aujourd\'Hui ',
      //                           ),
      //                         )),
      //                   ),
      //                   Icon(Icons.arrow_forward_ios_sharp),
      //                   /*add_to_photos_rounded
      //                       arrow_forward_ios_sharp
      //                       arrow_right_sharp*/
      //                 ],
      //               ),
      //             ),
      //             SizedBox(
      //               height: MediaQuery.of(context).size.height * 0.15,
      //               width: MediaQuery.of(context).size.width,
      //               child: FutureBuilder<QuerySnapshot>(
      //                 future: _TopAgenceFuture,
      //                 builder: (BuildContext context,
      //                     AsyncSnapshot<QuerySnapshot> snapshot) {
      //                   if (snapshot.hasError) {
      //                     return Text('Something went wrong');
      //                   }
      //
      //                   if (snapshot.connectionState ==
      //                       ConnectionState.waiting) {
      //                     return Text("Loading");
      //                   }
      //
      //                   return ListView(
      //                     scrollDirection: Axis.horizontal,
      //                     physics: NeverScrollableScrollPhysics(),
      //                     children: snapshot.data!.docs
      //                         .map((DocumentSnapshot document) {
      //                       Map<String, dynamic> _data =
      //                           document.data()! as Map<String, dynamic>;
      //                       return CardR(data: _data);
      //                     }).toList(),
      //                   );
      //                 },
      //               ),
      //
      //               /*ListView.builder(
      //                         itemCount: 20,
      //                         scrollDirection: Axis.horizontal,
      //                         itemBuilder: (context, index) => Container(
      //                               height: 100,
      //                               width: 100,
      //                               margin: EdgeInsets.all(10),
      //                               child: Center(
      //                                 child: Text('Cardrat $index'),
      //                               ),
      //                               color: Colors.green,
      //                             )),*/
      //             ),
      //           ],
      //         ),
      //       ),
      //       // ListView Horizontal Filtered Top Agence
      //       // SizedBox(
      //       //   child: PaginateFirestore(
      //       //     //reverse: true,
      //       //     itemsPerPage: 10,
      //       //     shrinkWrap: true,
      //       //     physics: NeverScrollableScrollPhysics(),
      //       //     itemBuilderType: PaginateBuilderType.gridView,
      //       //     isLive: true,
      //       //     query: FirebaseFirestore.instance
      //       //         .collection('Products')
      //       //         //.limit(10)
      //       //         .orderBy('createdAt', descending: true),
      //       //     itemBuilder: (context, documentSnapshots, index) {
      //       //       final _data = documentSnapshots[index].data() as Map?;
      //       //       return _data == null
      //       //           ? const Text('Error in data')
      //       //           : Padding(
      //       //               padding: const EdgeInsets.fromLTRB(6, 4, 4, 4),
      //       //               child: Card(
      //       //                 shape: RoundedRectangleBorder(
      //       //                   borderRadius: BorderRadius.circular(12),
      //       //                 ),
      //       //                 elevation: 5,
      //       //                 clipBehavior: Clip.antiAliasWithSaveLayer,
      //       //                 child: InkWell(
      //       //                   child: GridTile(
      //       //                     footer: Container(
      //       //                       child: ListTile(
      //       //                         title: Text(
      //       //                           _data['item'].toUpperCase(),
      //       //                           overflow: TextOverflow.ellipsis,
      //       //                           style: TextStyle(
      //       //                             color: Colors.white,
      //       //                             fontWeight: FontWeight.normal,
      //       //                             fontSize: 15,
      //       //                             fontFamily: 'Oswald',
      //       //                           ),
      //       //                         ),
      //       //                         subtitle: Text(
      //       //                           _data['price'] + '.00 DZD',
      //       //                           overflow: TextOverflow.ellipsis,
      //       //                           style: TextStyle(
      //       //                             color: Colors.indigoAccent,
      //       //                             fontWeight: FontWeight.bold,
      //       //                             fontSize: 17,
      //       //                             fontFamily: 'Oswald',
      //       //                           ),
      //       //                         ),
      //       //                       ),
      //       //                     ),
      //       //                     child: ShaderMask(
      //       //                       shaderCallback: (rect) {
      //       //                         return LinearGradient(
      //       //                           begin: Alignment.topCenter,
      //       //                           end: Alignment.bottomCenter,
      //       //                           colors: [
      //       //                             Colors.transparent,
      //       //                             Colors.black
      //       //                           ],
      //       //                         ).createShader(Rect.fromLTRB(
      //       //                             0, 0, rect.width, rect.height));
      //       //                       },
      //       //                       blendMode: BlendMode.darken,
      //       //                       child: CachedNetworkImage(
      //       //                         imageUrl: _data['themb'],
      //       //                         errorWidget: (context, url, error) =>
      //       //                             Icon(Icons.error),
      //       //                         fit: BoxFit.cover,
      //       //                       ),
      //       //                     ),
      //       //                   ),
      //       //                   onTap: () {},
      //       //                 ),
      //       //               ),
      //       //             );
      //       //     },
      //       //   ),
      //       // ),
      //
      //       // Container(
      //       //   // height: 250,
      //       //   color: Colors.white,
      //       //   child: Column(
      //       //     children: [
      //       //       if (_dataLength != 0)
      //       //         FutureBuilder(
      //       //           future: _TopHotelFuture,
      //       //           builder: (BuildContext context,
      //       //               AsyncSnapshot<QuerySnapshot> snapshot) {
      //       //             if (snapshot.hasError) {
      //       //               return Text('Something went wrong');
      //       //             }
      //       //
      //       //             if (snapshot.connectionState ==
      //       //                 ConnectionState.waiting) {
      //       //               return Text("Loading");
      //       //             }
      //       //             return snapshot.data == null
      //       //                 ? Center(
      //       //               child: CircularProgressIndicator(),
      //       //             )
      //       //                 : Padding(
      //       //               padding: const EdgeInsets.only(top: 0),
      //       //               child: CarouselSlider(
      //       //                   items: snapshot.data!.docs.map(
      //       //                     (DocumentSnapshot document) {
      //       //                       Map<String, dynamic> _data =
      //       //                           document.data()! as Map<String, dynamic>;
      //       //                       return SizedBox(
      //       //                         width:
      //       //                         MediaQuery.of(context).size.width,
      //       //                         child: ShaderMask(
      //       //                           shaderCallback: (rect) {
      //       //                             return LinearGradient(
      //       //                               begin: Alignment.topCenter,
      //       //                               end: Alignment.bottomCenter,
      //       //                               colors: [
      //       //                                 Colors.transparent,
      //       //                                 Colors.black
      //       //                               ],
      //       //                             ).createShader(Rect.fromLTRB(
      //       //                                 0, 0, rect.width, rect.height));
      //       //                           },
      //       //                           blendMode: BlendMode.darken,
      //       //                           child: CachedNetworkImage(
      //       //                             fit: BoxFit.cover,
      //       //                             imageUrl: _data['themb'],
      //       //
      //       //                           ),
      //       //                         ),
      //       //                       );
      //       //                     },
      //       //                   ).toList(),
      //       //                   options: CarouselOptions(
      //       //                     viewportFraction: 1,
      //       //                     initialPage: 0,
      //       //                     autoPlay: true,
      //       //                     height: 170,
      //       //                     /*   onPageChanged: (int i,
      //       //                           carouselPageChangedReason) {
      //       //                         setState(() {
      //       //                           _index = i;
      //       //                         });
      //       //                       }*/
      //       //                   )),
      //       //             );
      //       //           },
      //       //         ),
      //       //     ],
      //       //   ),
      //       // ),
      //       // Padding(
      //       //   padding: const EdgeInsets.all(8.0),
      //       //   child: Column(
      //       //     children: [
      //       //       SizedBox(
      //       //         height: MediaQuery.of(context).size.height * 0.25,
      //       //         width: MediaQuery.of(context).size.width,
      //       //         child: FutureBuilder<QuerySnapshot>(
      //       //           future: _TopHotelFuture,
      //       //           builder: (BuildContext context,
      //       //               AsyncSnapshot<QuerySnapshot> snapshot) {
      //       //             return ListView(
      //       //               scrollDirection: Axis.horizontal,
      //       //               physics: NeverScrollableScrollPhysics(),
      //       //               children: snapshot.data!.docs
      //       //                   .map((DocumentSnapshot document) {
      //       //                 Map<String, dynamic> _data =
      //       //                     document.data()! as Map<String, dynamic>;
      //       //                 return CardR(data: _data);
      //       //               }).toList(),
      //       //             );
      //       //           },
      //       //         ),
      //       //       ),
      //       //     ],
      //       //   ),
      //       // ),
      //       // Container(
      //       //   // height: 250,
      //       //   color: Colors.white,
      //       //   child: Column(
      //       //     children: [
      //       //       if (_dataLength != 0)
      //       //         FutureBuilder(
      //       //           future: getSliderImageFromDb(),
      //       //           builder:
      //       //               (BuildContext context,AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>> snapShot) {
      //       //             return snapShot.data == null
      //       //                 ? Center(
      //       //               child: CircularProgressIndicator(),
      //       //             )
      //       //                 : Padding(
      //       //               padding: const EdgeInsets.only(top: 0),
      //       //               child: CarouselSlider.builder(
      //       //                   itemCount: snapShot.data!.length,
      //       //                   itemBuilder:(BuildContext context, index, int) {
      //       //                     DocumentSnapshot<Map<String, dynamic>>
      //       //                     sliderImage = snapShot.data![index];
      //       //
      //       //                     Map<String, dynamic>? getImage =
      //       //                     sliderImage.data()
      //       //                     as Map<String, dynamic>;
      //       //
      //       //                     return SizedBox(
      //       //                       width:
      //       //                       MediaQuery.of(context).size.width,
      //       //                       child: ShaderMask(
      //       //                         shaderCallback: (rect) {
      //       //                           return LinearGradient(
      //       //                             begin: Alignment.topCenter,
      //       //                             end: Alignment.bottomCenter,
      //       //                             colors: [
      //       //                               Colors.transparent,
      //       //                               Colors.black
      //       //                             ],
      //       //                           ).createShader(Rect.fromLTRB(0, 0,
      //       //                               rect.width, rect.height));
      //       //                         },
      //       //                         blendMode: BlendMode.darken,
      //       //                         child: CachedNetworkImage(
      //       //                           fit: BoxFit.cover,
      //       //                           imageUrl: getImage['themb'],
      //       //                           /*placeholder: (context, url) => Center(
      //       //       child: CircularProgressIndicator(),
      //       //     ),*/
      //       //                           errorWidget:
      //       //                               (context, url, error) =>
      //       //                               Icon(Icons.error),
      //       //                         ),
      //       //                       ),
      //       //
      //       //                       /*Image.network(
      //       //                                   getImage['themb'],
      //       //                                   fit: BoxFit.cover,
      //       //                                 )*/
      //       //                     );
      //       //                   },
      //       //                   options: CarouselOptions(
      //       //                       viewportFraction: 1,
      //       //                       initialPage: 0,
      //       //                       autoPlay: true,
      //       //                       height: 170,
      //       //                       onPageChanged: (int i,
      //       //                           carouselPageChangedReason) {
      //       //                         setState(() {
      //       //                           _index = i;
      //       //                         });
      //       //                       })),
      //       //             );
      //       //           },
      //       //         ),
      //       //     ],
      //       //   ),
      //       // ), //Firestore Slider
      //       // SizedBox(
      //       //   child: FutureBuilder<QuerySnapshot>(
      //       //       future: _GridListTotal,
      //       //       builder: (BuildContext context,
      //       //           AsyncSnapshot<QuerySnapshot> snapshot) {
      //       //         //print(snapshot.connectionState);
      //       //         if (snapshot.connectionState == ConnectionState.waiting) {
      //       //           return CircularProgressIndicator();
      //       //         } else if (snapshot.connectionState ==
      //       //             ConnectionState.done) {
      //       //           if (snapshot.hasError) {
      //       //             return const Text('Error');
      //       //           } else if (snapshot.hasData) {
      //       //             return GridView.count(
      //       //               crossAxisCount: 2,
      //       //               childAspectRatio: 1.0,
      //       //               //mainAxisSpacing: 0.5,
      //       //               //crossAxisSpacing: 0.5,
      //       //               shrinkWrap: true,
      //       //               physics: NeverScrollableScrollPhysics(),
      //       //               children: snapshot.data!.docs
      //       //                   .map((DocumentSnapshot document) {
      //       //                 Map<String, dynamic> _data =
      //       //                     document.data()! as Map<String, dynamic>;
      //       //
      //       //                 /* final List<String> images =
      //       //                   List.from(document['urls']);
      //       //
      //       //                   List<GridTile> newGridTile = [];
      //       //
      //       //                   images.forEach((image) {
      //       //                     newGridTile.add(GridTile(
      //       //                       child: Image.network(
      //       //                         image,
      //       //                         fit: BoxFit.cover,
      //       //                       ),
      //       //                     ));
      //       //                   });*/
      //       //
      //       //                 return Padding(
      //       //                   padding: const EdgeInsets.fromLTRB(6, 4, 4, 4),
      //       //                   child: Card(
      //       //                     shape: RoundedRectangleBorder(
      //       //                       borderRadius: BorderRadius.circular(12),
      //       //                     ),
      //       //                     elevation: 5,
      //       //                     clipBehavior: Clip.antiAliasWithSaveLayer,
      //       //                     //color: Colors.lightBlue,
      //       //                     child: InkWell(
      //       //                       child: GridTile(
      //       //                         footer: Container(
      //       //                           // height: 60,
      //       //                           //color: Colors.black45,
      //       //                           child: ListTile(
      //       //                             title: Text(
      //       //                               _data['item'].toUpperCase(),
      //       //                               overflow: TextOverflow.ellipsis,
      //       //                               style: TextStyle(
      //       //                                 color: Colors.white,
      //       //                                 fontWeight: FontWeight.normal,
      //       //                                 fontSize: 15,
      //       //                                 fontFamily: 'Oswald',
      //       //                               ),
      //       //                             ),
      //       //                             subtitle: Text(
      //       //                               _data['price'] + '.00 DZD',
      //       //                               overflow: TextOverflow.ellipsis,
      //       //                               style: TextStyle(
      //       //                                 color: Colors.indigoAccent,
      //       //                                 fontWeight: FontWeight.bold,
      //       //                                 fontSize: 17,
      //       //                                 fontFamily: 'Oswald',
      //       //                               ),
      //       //                             ),
      //       //                           ),
      //       //                         ),
      //       //                         child: ShaderMask(
      //       //                           shaderCallback: (rect) {
      //       //                             return LinearGradient(
      //       //                               begin: Alignment.topCenter,
      //       //                               end: Alignment.bottomCenter,
      //       //                               colors: [
      //       //                                 Colors.transparent,
      //       //                                 Colors.black
      //       //                               ],
      //       //                             ).createShader(Rect.fromLTRB(
      //       //                                 0, 0, rect.width, rect.height));
      //       //                           },
      //       //                           blendMode: BlendMode.darken,
      //       //                           child: CachedNetworkImage(
      //       //                             imageUrl: _data['themb'],
      //       //                             /*placeholder: (context, url) => Center(
      //       //                                 child: CircularProgressIndicator(),
      //       //                               ),*/
      //       //                             errorWidget: (context, url, error) =>
      //       //                                 Icon(Icons.error),
      //       //                             fit: BoxFit.cover,
      //       //                           ),
      //       //                         ),
      //       //
      //       //                         /*Image.network(
      //       //                               _data['themb'],
      //       //                               fit: BoxFit.cover,
      //       //                             ),*/
      //       //                       ),
      //       //                       // focusColor: Colors.deepPurple ,
      //       //                       onTap: () {},
      //       //                     ),
      //       //                   ),
      //       //                 );
      //       //               }).toList(),
      //       //             );
      //       //           } else {
      //       //             return const Text('Empty data');
      //       //           }
      //       //         } else {
      //       //           return Text('State: ${snapshot.connectionState}');
      //       //         }
      //       //       }),
      //       // ),
      //
      //       PaginateFirestore(
      //         itemsPerPage: 15,
      //
      //         shrinkWrap: true,
      //         physics: NeverScrollableScrollPhysics(),
      //         itemBuilderType: PaginateBuilderType.gridView,
      //         //isLive: true,
      //         query: FirebaseFirestore.instance
      //             .collection('Products')
      //             .orderBy('createdAt', descending: false),
      //         itemBuilder: (context, documentSnapshots, index) {
      //           final _data = documentSnapshots[index].data() as Map?;
      //           return _data == null
      //               ? const Text('Error in data')
      //               : Padding(
      //             padding: const EdgeInsets.fromLTRB(6, 4, 4, 4),
      //             child: Card(
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(12),
      //               ),
      //               elevation: 5,
      //               clipBehavior: Clip.antiAliasWithSaveLayer,
      //               child: InkWell(
      //                 child: GridTile(
      //                   footer: Container(
      //                     child: ListTile(
      //                       title: Text(
      //                         _data['item'].toUpperCase(),
      //                         overflow: TextOverflow.ellipsis,
      //                         style: TextStyle(
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.normal,
      //                           fontSize: 15,
      //                           fontFamily: 'Oswald',
      //                         ),
      //                       ),
      //                       subtitle: Text(
      //                         _data['price'] + '.00 DZD',
      //                         overflow: TextOverflow.ellipsis,
      //                         style: TextStyle(
      //                           color: Colors.indigoAccent,
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 17,
      //                           fontFamily: 'Oswald',
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   child: ShaderMask(
      //                     shaderCallback: (rect) {
      //                       return LinearGradient(
      //                         begin: Alignment.topCenter,
      //                         end: Alignment.bottomCenter,
      //                         colors: [Colors.transparent, Colors.black],
      //                       ).createShader(Rect.fromLTRB(
      //                           0, 0, rect.width, rect.height));
      //                     },
      //                     blendMode: BlendMode.darken,
      //                     child: CachedNetworkImage(
      //                       imageUrl: _data['themb'],
      //                       errorWidget: (context, url, error) =>
      //                           Icon(Icons.error),
      //                       fit: BoxFit.cover,
      //                     ),
      //                   ),
      //                 ),
      //                 onTap: () {},
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }

  // Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
  //     getSliderImageFromDb() async {
  //   final QuerySnapshot<Map<String, dynamic>> _sliderShot =
  //       await FirebaseFirestore.instance
  //           .collection('Products')
  //           .where('item', isEqualTo: 'Autres')
  //           .get();
  //   if (mounted) {
  //     // setState(() {
  //     //   _dataLength = _sliderShot.docs.length;
  //     //   print(_dataLength);
  //     // });
  //   }
  //   return _sliderShot.docs;
  // }

  // void uploadRandom() async {
  //   final postCollection =
  //       FirebaseFirestore.instance.collection('Products').withConverter<Post>(
  //             fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
  //             toFirestore: (post, _) => post.toJson(),
  //           );
  //   final numbers = List.generate(100, (index) => index + 1);
  //   for (final number in numbers) {
  //     var prix = Random().nextInt(5000);
  //     List<String> listCat = [
  //       'Hotel',
  //       'Residence',
  //       'Agence',
  //       'Autres',
  //       'Sponsors',
  //       'karaté',
  //       'ingeniering',
  //       'function',
  //       'is',
  //       'used',
  //       'to',
  //       'insert',
  //       'the',
  //       'multiple',
  //       'value',
  //       'at',
  //       'the',
  //       'specified',
  //       'index',
  //       'position',
  //     ];
  //     var randomItem = (listCat..shuffle()).first;
  //     var catego = listCat[0];
  //     final post = Post(
  //         item: '$catego',
  //         code: 'Random Code $number',
  //         category: '$catego',
  //         price: '$prix',
  //         likes: 'Random likes $number', //Random().nextInt(1000),
  //         createdAt: DateTime.now(),
  //         decription : "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
  //         imageUrl: 'https://source.unsplash.com/random?sig=$number',
  //         themb: 'https://source.unsplash.com/random?sig=$number');
  //     postCollection.add(post);
  //   }
  // }
}
