import 'package:flutter/material.dart';
import 'package:flutter_tests_practice/repository/user_repo.dart';

import 'model/user.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(users: UserRepoSitory().getUser()),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.users});
  final Future<List<User>> users;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserRepoSitory userRepoSitory = UserRepoSitory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: FutureBuilder(
        future: widget.users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<User>? users = snapshot.data;
            return ListView.builder(
              itemCount: users!.length,
              itemBuilder: (context, index) {
                final User user = users[index];
                return ListTile(
                    title: Text(user.name), subtitle: Text(user.email));
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
