import 'dart:convert';

import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String field = '';
  String urlread = '';
  String urlwrite = '';
  String urlreadtank = '';
  String urlWriteTankTotalLitre = '';
  String urlWriteTankTotalCm = '';
  String ValueurlWriteTankTotalLitre = '';
  String ValueurlWriteTankTotalCm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'New poste',
          style: TextStyle(color: Colors.green, fontSize: 20),
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
        elevation: 1,
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
                    label: Text('name post'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir name post';
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
                    label: Text('field post'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir le field post';
                    }
                    return null;
                  },
                  onChanged: (value) => field = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    label: Text('url read post'),
                    contentPadding: EdgeInsets.only(left: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez sasisir url read post';
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
                    label: Text('url write post'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir url write post';
                    }
                    return null;
                  },
                  onChanged: (value) => urlwrite = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('url read tank value'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir url write';
                    }
                    return null;
                  },
                  onChanged: (value) => urlreadtank = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('url write tank total cm value'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir url write';
                    }
                    return null;
                  },
                  onChanged: (value) => urlWriteTankTotalCm = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('value total cm ex 10 = 10 cm'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir url write';
                    }
                    return null;
                  },
                  onChanged: (value) => ValueurlWriteTankTotalCm = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('url write tank total Littre Max value'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir url write';
                    }
                    return null;
                  },
                  onChanged: (value) => urlWriteTankTotalLitre = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('value total Littre ex 10 = 10 Littre'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir url tank littre write';
                    }
                    return null;
                  },
                  onChanged: (value) => ValueurlWriteTankTotalLitre = value,
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          CollectionReference posts =
                              FirebaseFirestore.instance.collection('posts');
                          http
                              .get(Uri.parse(
                                  '$urlWriteTankTotalCm=$ValueurlWriteTankTotalCm'))
                              .then((response) {
                            print(response.body);
                            return http.get(Uri.parse(
                                '$urlWriteTankTotalLitre=$ValueurlWriteTankTotalLitre'));
                          }).then((response) {
                            print(response.body);
                          });

                          Future<void> addPost() {
                            // Call the user's CollectionReference to add a new user
                            // print('object');

                            return posts
                                .add({
                                  'name': name, // John Doe
                                  'field': field, // Stokes and Sons
                                  'urlread': urlread,
                                  'urlwrite': urlwrite,
                                  'urlWriteTankTotalCm': urlWriteTankTotalCm,
                                  'urlWriteTankTotalLitre':
                                      urlWriteTankTotalLitre,
                                  'urlreadtank': urlreadtank,
                                  'valueTotalCm': ValueurlWriteTankTotalCm,
                                  'ValueTotallittre':
                                      ValueurlWriteTankTotalLitre
                                })
                                .then(
                                  (value) => Navigator.of(context).pop(),
                                )
                                .catchError(
                                  (error) =>
                                      // ignore: avoid_print
                                      print("Failed to add user: $error"),
                                );
                          }

                          addPost();
                        }
                      },
                      child: const Text(
                        'ajouter',
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
