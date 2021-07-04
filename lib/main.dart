import 'package:flutter/material.dart';
import 'profile_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      // theme: ThemeData(primarySwatch: Colors.red),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profile1(),
      debugShowCheckedModeBanner: false,
    );
  }
}
