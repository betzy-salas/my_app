import 'package:flutter/material.dart';
import 'package:flutter_app/components/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Corresponsal Bancario Bancolombia',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
