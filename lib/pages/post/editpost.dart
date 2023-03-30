import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Arguments {
  const Arguments({
    required this.field,
    required this.document,
    required this.name,
    required this.urlread,
    required this.urlwrite,
    required this.urlWriteTankTotalLitre,
    required this.urlWriteTankTotalCm,
    required this.urlreadtank,
  });

  final String document;
  final String field;
  final String name;
  final String urlread;
  final String urlwrite;
  final String urlWriteTankTotalLitre;
  final String urlWriteTankTotalCm;
  final String urlreadtank;
}

class EditPost extends StatefulWidget {
  const EditPost({super.key});

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final _formKey = GlobalKey<FormState>();
  Map data = {};
  String name = '';
  String field = '';
  String urlread = '';
  String urlwrite = '';
  String urlWriteTankTotalLitre = '';
  String urlWriteTankTotalCm = '';
  String valueCm = '';
  String valueLitle = '';
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final data = ModalRoute.of(context)!.settings.arguments as Arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'Edit Post',
          style: TextStyle(color: Colors.blue, fontSize: 20),
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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                  controller: TextEditingController(text: data.name),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('name'),
                  ),
                  onChanged: (value) => name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir name';
                    }
                    name = value;
                    return null;
                  },
                ),

                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: TextEditingController(text: data.field),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('field'),
                  ),
                  onChanged: (value) => field = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir field';
                    }
                    field = value;
                    return null;
                  },
                ),

                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: TextEditingController(text: data.urlread),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    label: Text('url read'),
                    contentPadding: EdgeInsets.only(left: 20),
                  ),
                  onChanged: (value) => urlread = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez sasisir url read';
                    }
                    urlread = value;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: TextEditingController(text: data.urlwrite),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('url write'),
                  ),
                  onChanged: (value) => urlwrite = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir url write';
                    }
                    urlwrite = value;
                    return null;
                  },
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
                        if (_formKey.currentState!.validate()) {
                          CollectionReference posts =
                              FirebaseFirestore.instance.collection('posts');

                          Future<void> addPost() {
                            // Call the user's CollectionReference to add a new user
                            // print('object');
                            return posts
                                .doc(data.document)
                                .update({
                                  'name': name, // John Doe
                                  'field': field, // Stokes and Sons
                                  'urlread': urlread,
                                  'urlwrite': urlwrite
                                })
                                .then(
                                  (value) => Navigator.of(context).pop(),
                                )
                                .catchError(
                                  (error) =>
                                      // ignore: avoid_print
                                      print("Failed to add : $error"),
                                );
                          }

                          addPost();
                        }
                      },
                      child: const Text(
                        'edit',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      )),
                )
              ],
            ),
            key: _formKey,
          ),
        ),
      ),
    );
  }
}
