// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../add_dif/add_products.dart';
// import '../database.dart';
// import 'package:flutter/foundation.dart';
//
//
// class RealTimeDataDisplay extends StatefulWidget {
//   const RealTimeDataDisplay({Key? key}) : super(key: key);
//
//   @override
//   _RealTimeDataDisplayState createState() => _RealTimeDataDisplayState();
// }
//
// class _RealTimeDataDisplayState extends State<RealTimeDataDisplay> {
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Container(
//         child: ListView(
//           //scrollDirection: Axis.vertical,
//           //shrinkWrap: true,
//           //padding:EdgeInsets.all(10),
//           children: [
//
//             Container(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (_) {
//                     return AddProd();
//                   }));
//                 },
//                 child: Text('Stepper'),),
//             ),
//             Wrap(
//               spacing: 50.0,
//               //direction: Axis.horizontal,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: Text(
//                     "Flash Promotion",
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: Card(
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         // color: Colors.lightBlue,
//                         elevation: 5,
//                         child: Ink.image(
//                               image: NetworkImage(
//                                 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//                               ),
//                               //colorFilter: ColorFilters.greyscale,
//                               child: InkWell(
//                                 onTap: () {},
//                               ),
//                               height: 90,
//                               //width: 120,
//                               fit: BoxFit.cover,
//                             ),
//
//
//                             //Text("item: "),
//
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Card(
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         // color: Colors.lightBlue,
//                         elevation: 5,
//                         child: Stack(
//                           children: [
//
//                             Ink.image(
//                               image: NetworkImage(
//                                   'https://placeimg.com/640/480/any'),
//                               //colorFilter: ColorFilters.greyscale,
//                               child: InkWell(
//                                 onTap: () {},
//                               ),
//                               height: 90,
//                               //width: 120,
//                               fit: BoxFit.cover,
//                             ),
//                             getSingleData(),
//
//                             //Text("item: "),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Card(
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         // color: Colors.lightBlue,
//                         elevation: 5,
//                         child: Stack(
//                           children: [
//
//                             Ink.image(
//                               image: NetworkImage(
//                                   'https://placeimg.com/640/480/any'),
//                               //colorFilter: ColorFilters.greyscale,
//                               child: InkWell(
//                                 onTap: () {},
//                               ),
//                               height: 90,
//                               //width: 120,
//                               fit: BoxFit.cover,
//                             ),
//                             getSingleData(),
//
//                             //Text("item: "),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//
//                       flex: 1,
//                       child: Card(
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         shape: RoundedRectangleBorder(
//
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         // color: Colors.lightBlue,
//                         elevation: 5,
//
//                         child: Stack(
//                           children: [
//
//                             Ink.image(
//                               image: NetworkImage(
//                                   'https://placeimg.com/640/480/any'),
//                               //colorFilter: ColorFilters.greyscale,
//                               child: InkWell(
//                                 onTap: () {},
//                               ),
//                               height: 90,
//                               //width: 120,
//                               fit: BoxFit.cover,
//                             ),
//                             getSingleData(),
//
//                             //Text("item: "),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             Wrap(
//               //direction: Axis.horizontal,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: Text(
//                     "Top Hôtels",
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: Card(
//                         color: Colors.lightBlue,
//                         elevation: 5,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 5, right: 5),
//                           child: Container(
//                             height: 90,
//                             width: 150,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Card(
//                         color: Colors.lightBlue,
//                         elevation: 5,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 5, right: 5),
//                           child: Container(
//                             height: 90,
//                             width: 150,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Card(
//                         color: Colors.lightBlue,
//                         elevation: 5,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 5, right: 5),
//                           child: Container(
//                             height: 90,
//                             width: 150,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Card(
//                         color: Colors.lightBlue,
//                         elevation: 5,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 5, right: 5),
//                           child: Container(
//                             height: 90,
//                             width: 150,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Card(
//                         color: Colors.lightBlue,
//                         elevation: 5,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 5, right: 5),
//                           child: Container(
//                             height: 90,
//                             width: 150,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             Wrap(
//               //direction: Axis.horizontal,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: Text(
//                     "Top Résidences",
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: Card(
//                         color: Colors.lightBlue,
//                         elevation: 5,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 5, right: 5),
//                           child: Container(
//                             height: 90,
//                             width: 150,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Card(
//                         color: Colors.lightBlue,
//                         elevation: 5,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 5, right: 5),
//                           child: Container(
//                             height: 90,
//                             width: 150,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Card(
//                         color: Colors.lightBlue,
//                         elevation: 5,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 5, right: 5),
//                           child: Container(
//                             height: 90,
//                             width: 150,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//
//             /**************************************list view********************************************/
//             Container(
//               child: ListView(
//                 physics: NeverScrollableScrollPhysics(),
//                 //scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 children: [/*datafire()*/getGridData()],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ColorFilters {
//   static final greyscale = ColorFilter.matrix(<double>[
//     0.2126,
//     0.7152,
//     0.0722,
//     0,
//     0,
//     0.2126,
//     0.7152,
//     0.0722,
//     0,
//     0,
//     0.2126,
//     0.7152,
//     0.0722,
//     0,
//     0,
//     0,
//     0,
//     0,
//     1,
//     0,
//   ]);
// }
//
// class ApiImage {
//   final String imageUrl;
//   final String id;
//   ApiImage({
//     required this.imageUrl,
//     required this.id,
//   });
// }
//
//
//
// class card1 extends StatelessWidget {
//   const card1({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 1,
//       child: Card(
//         semanticContainer: true,
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         child: Image.network(
//           'https://placeimg.com/640/480/any',
//           fit: BoxFit.fill,
//         ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         elevation: 5,
//         margin: EdgeInsets.all(10),
//       ),
//     );
//   }
// }
