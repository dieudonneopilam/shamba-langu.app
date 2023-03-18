import 'package:flutter/material.dart';

class ArrosePage extends StatefulWidget {
  const ArrosePage({super.key});

  @override
  State<ArrosePage> createState() => _ArrosePageState();
}

class _ArrosePageState extends State<ArrosePage> {
  final _key = GlobalKey<FormState>();
  int quantite = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 80, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.roundabout_left)),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Arroser le champ',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Center(
              child: Image.asset('assets/images/arroser1.png'),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Center(
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(
                      child: Text(
                        'Choux et Haricots',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'entrer la Qte en L : ex 10 = 10L',
                        suffixIcon: Icon(Icons.numbers_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          colors: [
                            Colors.red.withOpacity(.7),
                            Colors.red.withOpacity(.5),
                          ],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'arroser',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    )
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
