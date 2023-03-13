import 'package:flutter/material.dart';
import 'package:shamba/pages/home/bottonbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Shamba Langu',
        debugShowCheckedModeBanner: false,
        home: BottonBar());
  }
}
