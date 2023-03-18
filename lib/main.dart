import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shamba/pages/accueil/accueil.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Shamba Langu', debugShowCheckedModeBanner: false, home: Page());
  }
}

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserInformation(),
    );
  }
}

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.amber,
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        print('object');

        return Container(
          color: Colors.red,
          child: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              print('data => $data');
              return ListTile(
                title: Text(
                  data['name'],
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(data['url']),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
