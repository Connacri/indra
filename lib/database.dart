// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
//
// class datafire extends StatefulWidget {
//   const datafire({Key? key}) : super(key: key);
//
//   @override
//   _datafireState createState() => _datafireState();
// }
//
// class _datafireState extends State<datafire> {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     return _imageURLs();
//   }
// }
//
// class _imageURLs extends StatefulWidget {
//   @override
//   _imageURLsState createState() => _imageURLsState();
// }
//
// class _imageURLsState extends State<_imageURLs> {
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('imageURLs').snapshots(includeMetadataChanges: true);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }
//
//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['item']),
//               subtitle: Text(data['price']),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
//
//
//
//
//
//
// @override
// Widget getData() {
//
//   final databaseRef =
//       FirebaseDatabase.instance.reference().child('items_varicom');
//
//   return FirebaseAnimatedList(
//     shrinkWrap: true,
//     physics: NeverScrollableScrollPhysics(),
//     query: databaseRef,
//     sort: (a, b) {
//       return b.value['time']
//           .toString()
//           .toLowerCase()
//           .compareTo(a.value['time'].toString().toLowerCase());
//     },
//     itemBuilder: (BuildContext context, DataSnapshot snapshot,
//         Animation<double> animation, int index) {
//       var x = snapshot.value['item'];
//       print(x);
//
//       return ListTile(
//           leading: FlutterLogo(),
//           //CircleAvatar(backgroundImage: NetworkImage('imageurl'),),
//           title: Text(
//             snapshot.value['item'],
//             style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//           ),
//           subtitle:
//               Text(snapshot.value!['price'] + "\t" + snapshot.value['time']),
//           isThreeLine: false,
//           trailing: IconButton(
//             //Icons.keyboard_arrow_right
//             onPressed: () {
//               var keyFinder = snapshot.key;
//               print(keyFinder);
//             },
//             icon: Icon(Icons.home),
//           ));
//     },
//   );
// }
// //**********************************************************************************************************
// Stream collectionStream = FirebaseFirestore.instance.collection('imageURLs').snapshots();
// Stream documentStream = FirebaseFirestore.instance.collection('imageURLs').doc().snapshots();
//
// Future<Widget> fire_store()  async {
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('imageURLs').snapshots();
//
//   return StreamBuilder<QuerySnapshot>(
//     stream: _usersStream,
//     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//       /*if (snapshot.hasError) {
//         return Text('Something went wrong');
//       }
//
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return Text("Loading");
//       }*/
//
//       return ListView(
//         children: snapshot.data!.docs.map((DocumentSnapshot document) {
//           Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//           return ListTile(
//             title: Text(data['item']),
//             subtitle: Text(data['price']),
//           );
//         }).toList(),
//       );
//     },
//   );
//
// }
//
//
//
//
// //Stream collectionStream = FirebaseFirestore.instance.collection('imageURLs').snapshots();
// //Stream documentStream = FirebaseFirestore.instance.collection('imageURLs').doc().snapshots();
//
//
//
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('imageURLs').snapshots();
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }
//
//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['item']),
//               subtitle: Text(data['price']),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
//
// //**********************************************************************************************************
//
// Widget ItemTotal() {
//   final databaseRef =
//       FirebaseDatabase.instance.reference().child('items_varicom');
//   CollectionReference itemS = FirebaseFirestore.instance.collection('UserContent');
//   return new Container(
//       child: new Column(children: <Widget>[
//     new Flexible(
//       child: new FirebaseAnimatedList(
//           query: databaseRef,
//           sort: (a, b) {
//             return b.value['time']
//                 .toString()
//                 .toLowerCase()
//                 .compareTo(a.value['time'].toString().toLowerCase());
//           },
//           itemBuilder: (_, DataSnapshot snapshot, Animation<double> animation,
//               int index) {
//             return ListTile(
//               leading: FlutterLogo(),
//               //CircleAvatar(backgroundImage: NetworkImage('imageurl'),),
//               title: Text(
//                 snapshot.value['item'],
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//               ),
//               subtitle:
//                   Text(snapshot.value['price'] + "\t" + snapshot.value['time']),
//               isThreeLine: false,
//               trailing: Icon(Icons.keyboard_arrow_right),
//
//               onTap: () {
//                 print('category');
//               },
//             );
//           }),
//     )
//   ]));
// }
//
// Widget getGridData() {
//   final databaseRef =
//       FirebaseDatabase.instance.reference().child('items_varicom');
//   final ref = databaseRef.reference();
//
//   CollectionReference imgRef =
//   FirebaseFirestore.instance.collection('UserContent');//*****************
//   imgRef = FirebaseFirestore.instance.collection('imageURLs');//**********
//
//   return FirebaseAnimatedList(
//     shrinkWrap: true,
//     physics: NeverScrollableScrollPhysics(),
//     query: databaseRef,
//     sort: (a, b) {
//       return b.value['time']
//           .toString()
//           .toLowerCase()
//           .compareTo(a.value['time'].toString().toLowerCase());
//     },
//     itemBuilder: (BuildContext context, DataSnapshot snapshot,
//         Animation<double> animation, int index) {
//       var x = snapshot.value['item'];
//       print(x);
//
//       return ListTile(
//           leading: FlutterLogo(),
//           //CircleAvatar(backgroundImage: NetworkImage('imageurl'),),
//           title: Text(
//             snapshot.value['item'],
//             style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//           ),
//           subtitle:
//               Text(snapshot.value['price'] + "\t" + snapshot.value['time']),
//           isThreeLine: false,
//           trailing: IconButton(
//             //Icons.keyboard_arrow_right
//             onPressed: () {
//               var keyFinder = snapshot.key;
//               print(keyFinder);
//             },
//             icon: Icon(Icons.home),
//           ));
//     },
//   );
// }
//
// Widget getSingleData() {
//   final databaseRef =
//       FirebaseDatabase.instance.reference().child('items_varicom');
//   final ref = databaseRef.reference();
//
//   return FirebaseAnimatedList(
//     shrinkWrap: true,
//     physics: NeverScrollableScrollPhysics(),
//     query: databaseRef.orderByChild("item").equalTo("ramzi"),
//     itemBuilder: (BuildContext context, DataSnapshot snapshot,
//         Animation<double> animation, int index) {
//       //var x = snapshot.value['item'];
//      // print(x);
//
//       return Wrap(
//         children: [
//           Text(
//             snapshot.value['price'],
//             style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white),
//           ),
//         ],
//       );
//     },
//   );
// }
