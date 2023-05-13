import 'package:flutter/material.dart';
// import 'package:knowitall/home.dart';

import 'package:knowitall/dbHelper/mongodb.dart';
import 'package:knowitall/screen/authentication/signin.dart';
import 'package:knowitall/screen/screen.dart';
import 'package:knowitall/screen/splash/splash.dart';
import 'package:knowitall/services/shared_service.dart';

Widget _defaultHome = const Splash();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  bool _result = await SharedService.isLoggedIn();
  if(_result){
    _defaultHome = const Nav();
  }
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'KnowItAll',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _defaultHome,
      // initialRoute: Nav.routeName,
      // routes: routes,
    );
  }
}
