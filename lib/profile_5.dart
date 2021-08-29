import 'package:flutter/material.dart';
import 'user.dart';
// import 'provider.dart';

Profile _profile = Profile_Provider.profile();
TabController _tabController;

List<String> photos() {
  return List.generate(15, (index) {
    return 'assets/nature.jpg';
  });
}

class Profile5 extends StatefulWidget {
  @override
  _Profile5State createState() => _Profile5State();
}

class _Profile5State extends State<Profile5>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.black),
          ),
        ],
      ),
      body: _bodyContent(context),
    );
  }
}

Widget _bodyContent(BuildContext context) {
  return Container(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _profileDetails(context),
        Flexible(child: _tabBar(context)),
      ],
    ),
  );
}

Widget _profileDetails(BuildContext context) {
  return Flexible(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 125,
          height: 125,
          margin: EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/me2.jpg'),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            _profile.user.name,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          ),
        ),
        Text(
          _profile.user.job,
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 16,
          ),
        ),
        _followButton(context),
        // _tabBar(context),
      ],
    ),
  );
}

Widget _followButton(BuildContext context) {
  return Align(
    child: MaterialButton(
      color: Colors.orange,
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

Widget _tabBar(BuildContext context) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
      TabBar(
        unselectedLabelColor: Colors.grey.shade400,
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorWeight: 3,
        labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        indicatorPadding: EdgeInsets.symmetric(horizontal: 24),
        controller: _tabController,
        tabs: [
          Tab(
            text: 'PHOTOS',
          ),
          Tab(
            text: 'VIDEOS',
          ),
          Tab(
            text: 'POSTS',
          ),
          Tab(
            text: 'FRIENDS',
          ),
        ],
      ),
      Flexible(
        child: TabBarView(
          controller: _tabController,
          children: [
            _photos(context),
            _videos(context),
            _posts(context),
            _friends(context),
          ],
        ),
      ),
    ],
  );
}

_photos(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(8),
    child: GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/nature.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

_videos(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(8),
    child: GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/nature1.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        );
      }),
    ),
  );
}

_posts(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(8),
    child: GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/nature3.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        );
      }),
    ),
  );
}

_friends(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(8),
    child: GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/nature4.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        );
      }),
    ),
  );
}
