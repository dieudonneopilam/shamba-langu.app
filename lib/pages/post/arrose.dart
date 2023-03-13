import 'package:flutter/material.dart';

class ArrosePage extends StatefulWidget {
  const ArrosePage({super.key});

  @override
  State<ArrosePage> createState() => _ArrosePageState();
}

class _ArrosePageState extends State<ArrosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
