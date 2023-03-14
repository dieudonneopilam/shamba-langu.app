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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(colors: [
                        Colors.blue,
                        Color.fromARGB(255, 76, 120, 175)
                      ]),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "name poste",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "last houre",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: Form(
                            key: _key,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      scrollPadding: const EdgeInsets.all(5),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'veillez entrer la quantité à liberer';
                                        }
                                      },
                                      onChanged: (value) => quantite == value,
                                      decoration: const InputDecoration(
                                          hintText: 'Quantite en L',
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 60,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.green,
                                        Color.fromARGB(255, 6, 204, 102)
                                      ],
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {}
                                    },
                                    child: const Text(
                                      'arroser',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Image.asset('assets/images/arroser1.png'),
          ],
        ),
      ),
    );
  }
}
