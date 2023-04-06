import 'package:flutter/material.dart';
import 'package:flutter_tests_practice/repository/user_repo.dart';
import 'package:http/http.dart';

import 'model/user.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HttpMock(),
      );
}

class HttpMock extends StatelessWidget {
  HttpMock({super.key});
  final Future<User> getUsers = UserRepository(Client()).getUser();
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Http Mock')),
      body: FutureBuilder(
        future: getUsers,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Center(child: Text(snapshot.data.toString()));
        },
      ));
}
