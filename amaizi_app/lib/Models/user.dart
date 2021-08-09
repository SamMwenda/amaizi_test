// Dart object from api response
class User {
  final String name;

  User({
      required this.name,
      });

  factory User.fromJson(
    Map<dynamic, dynamic> user,
  ) {
    return User(
      name: user['name'],
    );
  }
}
