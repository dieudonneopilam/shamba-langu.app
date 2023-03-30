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
          Center(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/arroser.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  width: double.infinity,
                  height: 100,
                  child: Image.asset(
                    'assets/images/gdsc.png',
                    fit: BoxFit.cover,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 241, 241, 241)),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: const Text(
              'une application aui vous permet de faire le control de toute chose à distance, exploiter plus de parametre',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
