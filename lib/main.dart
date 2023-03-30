// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shamba/pages/accueil/accueil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shamba/pages/home/bottonbar.dart';
import 'package:shamba/pages/post/arrose.dart';
import 'package:shamba/pages/post/editpost.dart';
import 'package:shamba/pages/post/post.dart';
import 'package:shamba/pages/profil/profil.dart';
import 'package:shamba/pages/tank/tank.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shamba Langu',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Accueil(),
        '/home': (context) => const BottonBar(),
        '/posts': (context) => const PostsPage(),
        '/editpost': (context) => const EditPost(),
        '/tanks': (context) => const Tankspage(),
        '/arroser': (context) => const ArrosePage(),
        '/edittank': (context) => const ArrosePage(),
        '/about-us': (context) => const Profil()
      },
    );
  }
}
