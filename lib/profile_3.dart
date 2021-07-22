import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user.dart';
import 'provider.dart';

class Profile3 extends StatefulWidget {
  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  Profile profile = ProfileProvider.getProfile();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/bg.jpg',
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(FontAwesomeIcons.bars),
            ),
          ),
        )
      ],

      // body:
      // Container(
      //   height: 400,
      //   child: Image.asset(
      //     'assets/bg.jpg',
      //     fit: BoxFit.cover,
      //   ),
      // ),
    );
  }
}
