import 'user.dart';

class ProfileProvider {
  static Profile getProfile() {
    return Profile(
      user: User(
          name: 'Mohamed ETTAIBI',
          address: 'Hay Almanar Rue 6 N 31',
          job: 'Teacher',
          about:
              'Experienced PMP with a background in law and 7+ years experience growing revenue for a Massachusetts-based electronics firm. Seeking to leverage leadership expertise as project manager for Paylocity. Guest speaker at the Northeast Lean Conference in 2014.'),
      followers: 234,
      following: 66,
      friends: 4,
    );
  }
}
