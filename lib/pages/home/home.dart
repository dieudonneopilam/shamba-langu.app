import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Shamba Langu',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'une application aui vous permet de faire le control de toute chose à distance',
            style: TextStyle(fontSize: 20),
          ),
          Text('data')
        ],
      ),
    );
  }
}
