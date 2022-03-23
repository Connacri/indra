import 'package:cached_network_image/cached_network_image.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indra/Hotel/Book.dart';

class global_rooms extends StatefulWidget {
  const global_rooms({Key? key}) : super(key: key);

  @override
  _global_roomsState createState() => _global_roomsState();
}

class _global_roomsState extends State<global_rooms> {
  late DateTime _selectedDate;
  late DateTime _selectedDate1;
  late DateTime _selectedDate2;
  late DateTime _selectedDate3;
  late DateTime _selectedDate4;
  late DateTime _selectedDate5;
  late DateTime _selectedDate6;

  FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<QuerySnapshot> _listRooms = FirebaseFirestore.instance
      .collection('Booking')
      .get();

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now();
    _selectedDate1 = _selectedDate.add(Duration(days: 1));
    _selectedDate2 = _selectedDate.add(Duration(days: 2));
    _selectedDate3 = _selectedDate.add(Duration(days: 3));
    _selectedDate4 = _selectedDate.add(Duration(days: 4));
    _selectedDate5 = _selectedDate.add(Duration(days: 5));
    _selectedDate6 = _selectedDate.add(Duration(days: 6));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333A47),
      appBar: AppBar(
        title: Text('Ajouter Une Annonce'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return AddBook();
              }));
            },
            icon: Icon(Icons.logout),
          )
        ],
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(Icons.add),
        //       onPressed: () {
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Calendar Timeline',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.tealAccent[100]),
                ),
              ),
            ),
            CalendarTimeline(
              initialDate: //DateTime.now(),
              //    _selectedDate,
              DateTime(2022, 1, 01),// date de first view
              firstDate: //DateTime.now(),
                  DateTime(2020, 1,
                      22), //date du commencement du calendrier general maximum
              showYears: true,
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) {
                setState(() {
                  _selectedDate = date!;
                  _selectedDate1 = date.add(Duration(days: 1));
                  _selectedDate2 = date.add(Duration(days: 2));
                  _selectedDate3 = date.add(Duration(days: 3));
                  _selectedDate4 = date.add(Duration(days: 4));
                  _selectedDate5 = date.add(Duration(days: 5));
                  _selectedDate6 = date.add(Duration(days: 6));
                });
              },
              //onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.blueGrey,
              dayColor: Colors.teal[200],
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: Color(0xFF333A47),

              selectableDayPredicate: (date) => date.day != 23,
              locale:
                  'en_ISO', //********************************************en_ISO
            ),
            SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.teal[200])),
                  child:
                      Text('RESET', style: TextStyle(color: Color(0xFF333A47))),
                  onPressed: () => setState(() => _resetSelectedDate()),
                ),
              ),
            ),
            SizedBox(height: 20),
            // ListTile(
            //   leading: FlutterLogo(size: 56.0),
            //   title: Text('Today'.toUpperCase(),
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.amber,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   subtitle: Text('Hiya $_selectedDate' /*.toUpperCase()*/,
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.tealAccent,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   trailing: Icon(Icons.more_vert),
            // ),
            // ListTile(
            //   leading: FlutterLogo(size: 56.0),
            //   title: Text('Next Day'.toUpperCase(),
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.amber,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   subtitle: Text('Hiya $_selectedDate1' /*.toUpperCase()*/,
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.tealAccent,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   trailing: Icon(Icons.more_vert),
            // ),
            // ListTile(
            //   leading: FlutterLogo(size: 56.0),
            //   title: Text('Next 2 Day'.toUpperCase(),
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.amber,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   subtitle: Text('Hiya $_selectedDate2' /*.toUpperCase()*/,
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.tealAccent,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   trailing: Icon(Icons.more_vert),
            // ),
            // ListTile(
            //   leading: FlutterLogo(size: 56.0),
            //   title: Text('Next 3 Day'.toUpperCase(),
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.amber,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   subtitle: Text('Hiya $_selectedDate3' /*.toUpperCase()*/,
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.tealAccent,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   trailing: Icon(Icons.more_vert),
            // ),
            // ListTile(
            //   leading: FlutterLogo(size: 56.0),
            //   title: Text('Next 4 Day'.toUpperCase(),
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.amber,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   subtitle: Text('Hiya $_selectedDate4' /*.toUpperCase()*/,
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.tealAccent,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   trailing: Icon(Icons.more_vert),
            // ),
            // ListTile(
            //   leading: FlutterLogo(size: 56.0),
            //   title: Text('Next 5 Day'.toUpperCase(),
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.amber,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   subtitle: Text('Hiya $_selectedDate5' /*.toUpperCase()*/,
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.tealAccent,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   trailing: Icon(Icons.more_vert),
            // ),
            // ListTile(
            //   leading: FlutterLogo(size: 56.0),
            //   title: Text('Next 6 Day'.toUpperCase(),
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.amber,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   subtitle: Text('Hiya $_selectedDate6' /*.toUpperCase()*/,
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(
            //         color: Colors.tealAccent,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15,
            //         fontFamily: 'Oswald',
            //       )),
            //   trailing: Icon(Icons.more_vert),
            // ),

            FutureBuilder(
              future: _listRooms,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Visibility(
                        visible: snapshot.hasData,
                        child: Text(
                          snapshot.data.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 24),
                        ),
                      )
                    ],
                  );
                } else if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (snapshot.hasData) {
                    return Text(snapshot.data.toString(),
                        style:
                            const TextStyle(color: Colors.teal, fontSize: 36));
                  } else {
                    return const Text('Empty data');
                  }
                } else {
                  final List<DocumentSnapshot> documents = snapshot.data.docs;
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
                                  _data['Name'].toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    fontFamily: 'Oswald',
                                  ),
                                ),
                                subtitle: Text(
                                  _data['Room'],
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
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
