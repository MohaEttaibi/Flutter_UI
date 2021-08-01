import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user.dart';
import 'provider.dart';

Profile _profile = ProfileProvider.getProfile();

class Profile3 extends StatefulWidget {
  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(microseconds: 500), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/bg.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
                opacity: _visible ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: _bodyCard(context)),
          ),
        )
      ],
    );
  }
}

Widget _bodyCard(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    height: MediaQuery.of(context).size.height * 0.45,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _profileRow(context),
        ..._profileText(context),
        Spacer(flex: 2),
        _divider(context),
        _counter(context),
      ],
    ),
  );
}

List<Widget> _profileText(BuildContext context) {
  return [
    Padding(
      padding: EdgeInsets.only(left: 16, bottom: 8),
      child: Text(
        _profile.user.name,
        style: TextStyle(
            color: Color(0xff4e4e4e),
            fontSize: 22,
            fontWeight: FontWeight.w900),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Text(
        _profile.user.job,
        style: TextStyle(
          color: Colors.grey.shade400,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "Teaching is awesome with kids, build new generation make my life better.",
        style: TextStyle(
          color: Color(0xff4e4e4e),
          fontSize: 12,
          letterSpacing: 1.05,
        ),
      ),
    ),
  ];
}

Widget _profileRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/me2.jpg'),
          ),
          shape: BoxShape.circle,
        ),
      ),
      // Spacer(flex: 2),
      RaisedButton(
        onPressed: () {},
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 0,
        child: Text("ADD FRIEND"),
      ),
      RaisedButton(
        onPressed: () {},
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 0,
        child: Text(
          "FOLLOW",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}

Widget _counter(BuildContext context) {
  // Profile _profile = ProfileProvider.getProfile();
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Followers",
              style: TextStyle(
                  color: Color(0xff4e4e4e),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(_profile.followers.toString())
          ],
        ),
        Column(
          children: [
            Text(
              "Following",
              style: TextStyle(
                  color: Color(0xff4e4e4e),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(_profile.following.toString())
          ],
        ),
        Column(
          children: [
            Text(
              "Friends",
              style: TextStyle(
                  color: Color(0xff4e4e4e),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(_profile.friends.toString())
          ],
        ),
      ],
    ),
  );
}

Widget _divider(BuildContext context) {
  return Container(
    height: 1,
    color: Colors.grey.shade200,
  );
}
