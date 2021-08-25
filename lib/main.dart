import 'package:flutter/material.dart';
import 'package:study/DataLayer/Typeofdata/LocalData.dart';
import 'package:study/presentation/screens/StartScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resturant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.red,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xFFF3F5F7)),
      home: StartScreen(),
    );
  }
}
