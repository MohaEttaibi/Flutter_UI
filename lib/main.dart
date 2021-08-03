import 'package:flutter/material.dart';
import 'profile_4.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter UI',
      // theme: ThemeData(
      //   primarySwatch: Colors.orange,
      // ),
      home: Profile4(),
      debugShowCheckedModeBanner: false,
    );
  }
}
