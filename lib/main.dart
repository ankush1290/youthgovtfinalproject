import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youthgovt/blockchainfiles/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:youthgovt/blockchainfiles/features/dashboard/ui/dashboard_page.dart';
import 'package:youthgovt/blockchainfiles/features/entry/addentry_page.dart';
// import 'package:youthgovt/blockchainnmain/features/dashboard/ui/dashboard_page.dart';
// import 'package:provider/provider.dart';
// import 'package:youthgovt/contractlinking.dart';
import 'package:youthgovt/graph/areagraph.dart';
import 'package:youthgovt/graph/field.dart';
import 'package:youthgovt/graph/fullcodegraph.dart';
import 'package:youthgovt/graph/mainfile.dart';
// import 'package:youthgovt/graph/maingraph.dart';
import 'package:youthgovt/graph/piechart.dart';
// import 'package:youthgovt/hello_page.dart';
import 'package:youthgovt/home/homepage.dart';
import 'package:youthgovt/login/loginadmin.dart';
import 'package:youthgovt/login/loginhead.dart';
import 'package:youthgovt/login/mainheadlogin.dart';
import 'package:youthgovt/login/mainlogin.dart';
import 'package:youthgovt/login/mainloginadmin.dart';
import 'package:youthgovt/sample.dart';
import 'package:youthgovt/testgraph.dart';
import 'package:youthgovt/testing.dart';
import 'package:youthgovt/testing12.dart';

void main() async {
  if (kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAWL3A_3WNYH4IG9HIL_zZ-PhjodWZEryE",
            authDomain: "youthgovt-94964.firebaseapp.com",
            projectId: "youthgovt-94964",
            storageBucket: "youthgovt-94964.appspot.com",
            messagingSenderId: "470428427523",
            appId: "1:470428427523:web:53ad7687e7900f9ec83536"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouthGovt',
      theme: ThemeData(
        primaryColor: Colors.black
      ),
       initialRoute: '/home',
    routes: {
      '/home': (context) => const HomePage(),
      '/AdminLogin': (context) => const AdminLoginmain(),
      '/HeadLogin': (context) => const HeadLoginmain(),
      // '/AdminLogin': (context) => const HeadLoginmain(),
      '/AdminPanelmain': (context) => const AdminPage(),
      '/Headpanelmain': (context) => const HeadPage(),

    },
      
      
      home:HomePage());
  }
}

