import 'package:flutter/material.dart';
import 'user.dart';
import 'provider.dart';

Profile _profile = ProfileProvider.getProfile();

class Profile4 extends StatefulWidget {
  @override
  _Profile4State createState() => _Profile4State();
}

class _Profile4State extends State<Profile4> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/nature.jpg',
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
          body: Stack(
            children: [
              _bodyContent(context),
              _profileImage(context),
            ],
          ),
        )
      ],
    );
  }
}

Widget _bodyContent(BuildContext context) {
  return Positioned(
    left: 16,
    right: 16,
    bottom: 0,
    top: MediaQuery.of(context).size.height * .07,
    child: Container(
      padding: EdgeInsets.only(top: 75),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ListView(
        // padding: EdgeInsets.only(left: 24, right: 24),
        children: [
          Text(
            _profile.user.name,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              _profile.user.address,
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _followButton(context),
          ),
          _divider(context),
          _counter(context),
          _divider(context),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "PHOTOS (${_profile.photos.toString()})",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          _photos(context),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "ABOUT ME",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          _aboutme(context),
        ],
      ),
    ),
  );
}

Widget _profileImage(BuildContext context) {
  return Positioned(
    left: MediaQuery.of(context).size.width / 2 - 50,
    top: MediaQuery.of(context).size.height * .07 - 50,
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/me2.jpg'),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    ),
  );
}

Widget _followButton(BuildContext context) {
  return Align(
    child: MaterialButton(
      color: Colors.pinkAccent,
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          'FOLLOW',
          style: TextStyle(color: Colors.white),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
    ),
  );
}

Widget _divider(BuildContext context) {
  return Container(
    height: 1,
    color: Colors.grey.shade200,
  );
}

Widget _counter(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "Followers",
              style: TextStyle(
                  color: Colors.grey,
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
                  color: Colors.grey,
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
                  color: Colors.grey,
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

Widget _photos(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 100,
    padding: EdgeInsets.only(left: 16),
    child: ListView(
      children: List.generate(_profile.photos, (index) {
        return Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/me2.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }).toList(),
      scrollDirection: Axis.horizontal,
    ),
  );
}

Widget _aboutme(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: Text(
      "I am a Teacher, Teaching is awesome with kids, build new generation make my life better.",
      style: TextStyle(
        color: Colors.black45,
        fontSize: 14,
        letterSpacing: 1.1,
      ),
    ),
  );
}
