import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:indra/AddImage.dart';
import 'package:indra/Auth/Main_Auth.dart';
import 'package:indra/Authentification/AuthPage.dart';
import 'package:indra/Authentification/Auth_Add.dart';
import 'package:indra/Authentification/Test.dart';
import 'package:indra/Authentification/Utilsoth.dart';
import 'package:indra/Authentification/Utilsoth.dart';
import 'package:indra/Authentification/Utilsoth.dart';
import 'package:indra/Authentification/Utilsoth.dart';
import 'package:indra/Authentification/main.dart';
import 'package:indra/Authentification/tmanyik.dart';
import 'package:indra/Hotel/Gantt_Chart/gantt_chart_screen.dart';
import 'package:indra/Hotel/global_rooms.dart';
import 'package:indra/Hotel/khra.dart';
import 'package:indra/Hotel/test.dart';
import 'package:indra/Hotel/test2.dart';
import 'package:indra/Test/auth.dart';
import 'package:indra/Test/firestoreScriptPagination.dart';
import 'package:indra/Test/oudkniss.dart';
import 'package:indra/Test/pagination_v2.dart';
import 'package:indra/Test/testProfile.dart';
import 'package:indra/add_dif/card_test.dart';
import 'Test/Pagination & Infinite Scrolling.dart';
import 'webp.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp (Home());
    //(Splash());
}

final navigatorKey = GlobalKey<NavigatorState>();

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: Home(),
      duration: 3000,
      imageSize: 130,
      imageSrc: 'assets/icon/dolphin.png',
      text: "Guedouar Corp",
      textStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: 'Oswald',
        fontSize: 40.0,
      ),
      textType: //TextType.TyperAnimatedText,
          TextType.ColorizeAnimationText,
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
        Colors.white,
      ],
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // locale: Locale('fr'),
      //scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Splash screen Demo',
      home: example1,
    );
  }
}

/// This is the main application widget.
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
    //gantt_chart(),
    ouedkniss(),
    CardStateLess(), //**************************
    Pagination_Infinite_Scrolling(),
    conbb(), //**************************
    //ScriptPagination(),
    //RamzyPagination(),
    //Carrouselllll(),
    //CardTest(),
    //RealTimeDataDisplay(),
    //ProfileTest(providerConfigs: [],),//**********************************
    //CarouselDemo(),
    //Profile(),
    //Pagina(),
    //home(),
    //Shimme(),
    //RamzyPagination(),
    //Pagination_Infinite_Scrolling(),
    //ScriptPagination(),
    //Geoloca(),
    //test_loginst(),
    //MainPageAuth(),//***************************
    //ProfileTest(providerConfigs: [],),
    global_rooms(),
    //loadDataToCalendar()
    //EventCalendar()
    //dataTableTest()
    //khra()

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
//        heroTag: 'additemst',
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
                //AddImage(); //******************************************************taliya correct
                //AuthPage();
                //MainPageAuth();
              //Auth_add();
              Main_Auth();
            //test_loginst();
            //tmanyik();
            //auth();
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
          BottomNavigationBarItem(
            icon: Icon(Icons.three_k_plus_rounded),
            label: 'Gradienz',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
