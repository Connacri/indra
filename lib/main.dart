import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:indra/Test/geo.dart';
import 'package:indra/Test/pagination_seul.dart';
import 'package:indra/Test/pagination_v2.dart';
import 'AddImage.dart';
import 'Test/Pagination & Infinite Scrolling.dart';
import 'Test/carousel test.dart';
import 'Test/firestoreScriptPagination.dart';
import 'Test/pagination_view.dart';
import 'Test/shimmer.dart';
import 'add_dif/card_test.dart';
import 'home.dart';
import 'Fav.dart';
import 'screens/Home.dart';
import 'webp.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CardStateLess(),//**************************
    Pagination_Infinite_Scrolling(),
    conbb(),//**************************
    //ScriptPagination(),
    //RamzyPagination(),
    //Carrouselllll(),
    //CardTest(),
    //RealTimeDataDisplay(),
    //CarouselDemo(),
    //Profile(),
    //Pagina(),//*************************
    //home(),
    //Shimme(),
    //RamzyPagination(),
    //Pagination_Infinite_Scrolling(),
    //ScriptPagination(),
    Geoloca(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('BottomNavigationBar Sample'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return //Insert();
              //MyAppp();
              //addin();
              //UploadingImageToFirebaseStorage();
              //AddContacts();
              //HomePage2();
              //AddImageList();//***************
              // MyAppimg();
              AddImage();//******************************************************taliya correct
            // AddProd();
          }));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.threesixty),
            label: 'Messenger',
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profile',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.three_k_plus_rounded),
          //   label: 'Gradienz',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
