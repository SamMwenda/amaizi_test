import 'dart:convert';
import 'package:amaizi_app/Models/user.dart';
import 'package:http/http.dart' as http;

//request from api
class UserService {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  Future<List<User>> getUsers() async {
    final data = await http.get(url);
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);

      final user = <User>[];
      for (var item in jsonData) {
        user.add(User.fromJson(item));
      }
      return user.sublist(0,5);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
