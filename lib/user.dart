class User {
  String name, address, about, job;
  User({this.name, this.address, this.about, this.job});
}

class Profile {
  User user;
  // int followers, following, friends, photos;
  // Profile(
  // {this.user, this.followers, this.following, this.friends, this.photos});
  Profile(this.user);
}

class Profile_Provider {
  static Profile profile() {
    return Profile(User(name: 'Mohammed Ettaibi', job: 'Teacher'));
  }

  static List<String> photos() {
    return List.generate(15, (index) {
      return 'assets/nature.jpg';
    });
  }

  static List<String> videos() {
    return List.generate(15, (index) {
      return 'assets/nature.jpg';
    });
  }

  static List<String> posts() {
    return List.generate(15, (index) {
      return 'assets/nature.jpg';
    });
  }

  static List<String> friends() {
    return List.generate(15, (index) {
      return 'assets/nature.jpg';
    });
  }
}
