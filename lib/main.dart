import 'package:flutter/material.dart';
import 'profile_2.dart';
import 'profile_3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Profile2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
