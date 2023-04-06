import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserRepository {
  final http.Client client;

  UserRepository(this.client);
  Future<User> getUser() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
