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
      padding: const EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shamba Langu',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'une application aui vous permet de faire le control de toute chose à distance, exploiter plus de parametre',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(color: Colors.grey),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/arroser.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: Image.asset('assets/images/gdsc.png'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
