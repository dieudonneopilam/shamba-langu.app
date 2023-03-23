import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTank extends StatefulWidget {
  const AddTank({super.key});

  @override
  State<AddTank> createState() => _AddTankState();
}

class _AddTankState extends State<AddTank> {
  final _key = GlobalKey<FormState>();

  String name = '';
  String url = '';
  String urlread = '';
  String urlwrite = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'New Tank',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.blue,
            size: 30,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Form(
            // ignore: sort_child_properties_last
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('name Tank'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir name';
                    }
                    return null;
                  },
                  onChanged: (value) => name = value,
                ),

                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('url Tank'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir url';
                    }
                    return null;
                  },
                  onChanged: (value) => url = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    label: Text('url read Tank'),
                    contentPadding: const EdgeInsets.only(left: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez sasisir url read';
                    }
                    return null;
                  },
                  onChanged: (value) => urlread = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('url write Tank'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir url write';
                    }
                    return null;
                  },
                  onChanged: (value) => urlwrite = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                // ignore:, avoid_unnecessary_containers
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.blue)),
                  child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('processing')));
                      }
                      CollectionReference tanks =
                          FirebaseFirestore.instance.collection('tanks');

                      Future<void> addTank() {
                        // Call the user's CollectionReference to add a new user
                        return tanks
                            .add({
                              'name': name, // John Doe
                              'url': url, // Stokes and Sons
                              'urlread': urlread,
                              'urlwrite': urlwrite
                            })
                            .then(
                              (value) => Navigator.of(context).pop(),
                            )
                            .catchError(
                              (error) => print("Failed to add user: $error"),
                            );
                      }

                      addTank();
                    },
                    child: const Text(
                      'ajouter',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ),
                )
              ],
            ),
            key: _key,
          ),
        ),
      ),
    );
  }
}
