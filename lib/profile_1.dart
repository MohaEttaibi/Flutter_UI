import 'package:flutter/material.dart';
import 'user.dart';
import 'provider.dart';

class Profile1 extends StatefulWidget {
  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  Profile profile = ProfileProvider.getProfile();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'Nunito',
      ),
      child: Stack(
        children: <Widget>[
          Image.asset(
            'bg.jpg',
            fit: BoxFit.cover,
            // height: MediaQuery.of(context).size.height * 0.45,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'PROFILE',
                style:
                    TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.1),
              ),
              leading: IconButton(
                onPressed: () {},
                // hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  Icons.menu,
                  size: 30,
                ),
              ),
              actions: <Widget>[
                IconButton(
                    // hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    onPressed: () {}),
              ],
            ),
            body: Stack(
              children: <Widget>[
                CustomPaint(
                  painter: ProfilePainter(),
                  child: Container(),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.30,
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'me.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // backgroundColor: new Color(0xffffffff),
                    backgroundColor: Colors.transparent,
                    radius: 40.0,
                    // backgroundImage: NetworkImage(
                    // 'https://upload.wikimedia.org/wikipedia/commons/7/70/User_icon_BLACK-01.png'),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.42,
                  left: 24,
                  right: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        profile.user.name,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xff4a4a4a),
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.grey.shade400),
                          Text(profile.user.address),
                        ],
                      ),
                      SizedBox(height: 18),
                      Text(
                        'ABOUT ME',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      SizedBox(height: 18),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          profile.user.about,
                          softWrap: true,
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                      SizedBox(height: 20),
                      _bottomBar(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [Text('FOLLOWERS'), Text(profile.followers.toString())],
        ),
        Column(
          children: [Text('FOLLOWING'), Text(profile.following.toString())],
        ),
        Column(
          children: [Text('FRIENDS'), Text(profile.friends.toString())],
        ),
      ],
    );
  }
}

class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.color = Colors.white;
    path.lineTo(0, size.height * 0.39);
    path.lineTo(size.width, size.height * 0.45);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.25);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 380);
    path.lineTo(size.width, size.height - 280);
    path.lineTo(size.width, 0);
    // path.lineTo();
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
