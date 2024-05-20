import 'package:flutter/material.dart';
import 'Ui/listing_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.amberAccent
      ),
      home: ListingScreen(),
    );
  }
}
