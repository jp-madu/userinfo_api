import 'package:flutter/material.dart';

import 'package:userinfo_api/model/user.dart';
import 'package:userinfo_api/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API Call'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            // final phone = user.phone;
            // final color = user.gender == 'male' ? Colors.blue : Colors.red;
            final email = user.email;
            // final name = user['name']['first'];
            // final email = user['email'];
            // final imageUrl = user['picture']['thumbnail'];
            return ListTile(
              // title: Text(email),
              title: Text(user.name.last),
              subtitle: Text(user.name.first),
              leading: Text(user.dob.age.toString()),
              trailing: Text(user.location.coordinates.latitude),

              // subtitle: Text(user.nat),
              // subtitle: Text(user.userLocation.postcode),
              // tileColor: color,

              // title: Text(name),
              // subtitle: Text(email),
              // leading: ClipRRect(
              //   borderRadius: BorderRadius.circular(100),
              //   child: Image.network(imageUrl),

              // leading: CircleAvatar(
              //   child: Text('${index + 1}'),
              // ),
            );
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchUsers,
      // ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  // void fetchUserInApi() async {
  //   const url = 'https://randomuser.me/api/?results=10';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   setState(() {
  //     users = json['result']
  //   });
  // }

  // Future<void> fetchUsers() async {
  //   print('fetchUsers function called');
  //   const url = 'https://randomuser.me/api/?results=10';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final results = json['results'] as List<dynamic>;
  //   final transformed = results.map(
  //     (e) {
  //       final name = UserName(
  //           title: e['name']['title'],
  //           first: e['name']['first'],
  //           last: e['name']['last']);
  //       return User(
  //         gender: e['gender'],
  //         email: e['email'],
  //         phone: e['phone'],
  //         cell: e['cell'],
  //         nat: e['nat'],
  //         name: name,
  //       );
  //     },
  //   ).toList();
  //   setState(() {
  //     users = transformed;
  //   });
  //   print('fetchUsers Completed');
  // }
}
