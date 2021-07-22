import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user.dart';
import 'provider.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  Profile profile = ProfileProvider.getProfile();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'Nunito',
      ),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1625732865493-3d1a1e0d2d32?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=754&q=80'),
              ),
            ),
          ),
          // Image.asset(
          //   'assets/bg.jpg',
          //   fit: BoxFit.cover,
          //   alignment: FractionalOffset.center,
          // ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  FontAwesomeIcons.bars,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            body: Stack(
              children: [
                _profileTitle(context),
                _bodyContent(context),
                // _divider(context),
                // _aboutme(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileTitle(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 135,
                  width: 135,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: ExactAssetImage("assets/me.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            profile.user.name,
            style: TextStyle(
                fontSize: 26,
                fontFamily: 'Roboto-Bold',
                color: Colors.white,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 8),
          Text(
            profile.user.address,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Nunito-Light',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.29,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'FOLLOWERS',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        profile.followers.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'FOLLOWING',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        profile.following.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'FRIENDS',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        profile.friends.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _divider(context),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'ABOUTE ME',
                  style: TextStyle(
                    // color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            _aboutme(context),
            _friends(context),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: profile.friends,
                itemBuilder: (context, index) => Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage("assets/me.jpg"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade400,
    );
  }

  Widget _aboutme(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(profile.user.about),
      ),
    );
  }

  Widget _friends(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'FRIENDS (${profile.friends.toString()})',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
