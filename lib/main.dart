import 'package:flutter/material.dart';
import 'package:newproject_app/call_homepage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'zeego cloud',
      debugShowCheckedModeBanner: false,
      home: CallHomepage() ,
    );
  }
}
