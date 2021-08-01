class User {
  String name, address, about, job;
  User({this.name, this.address, this.about, this.job});
}

class Profile {
  User user;
  int followers, following, friends;
  Profile({this.user, this.followers, this.following, this.friends});
}
