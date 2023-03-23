import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shamba/pages/tank/addtank.dart';

class Tankspage extends StatefulWidget {
  const Tankspage({super.key});

  @override
  State<Tankspage> createState() => _TankspageState();
}

class _TankspageState extends State<Tankspage> {
  Stream<QuerySnapshot> tanks =
      FirebaseFirestore.instance.collection('tanks').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: tanks,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            backgroundColor: Colors.amber,
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Container(
          margin: const EdgeInsets.only(top: 60, left: 10, right: 10),
          width: double.infinity,
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  // color: Colors.blue,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Tanks',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddTank(),
                        ));
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              width: double.infinity,
              child: Column(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/images/tank.jfif')),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['name'],
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'visualiser',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'modifier',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'supprimer',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
          ]),
        );
      },
    );
  }
}
