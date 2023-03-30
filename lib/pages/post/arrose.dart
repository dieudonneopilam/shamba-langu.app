import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shamba/pages/post/editpost.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

class ArrosePage extends StatefulWidget {
  const ArrosePage({super.key});

  @override
  State<ArrosePage> createState() => _ArrosePageState();
}

class _ArrosePageState extends State<ArrosePage> {
  String quantiteReservoir = '';
  String quantiteSend = '';

  // ignore: unused_field
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Arguments;
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
                          icon: const Icon(
                            Icons.chevron_left,
                            size: 30,
                          ),
                        ),
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Center(
                child: Image.asset(
                  'assets/images/arroser.jfif',
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Center(
                child: Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      // ignore: sort_child_properties_last
                      children: [
                        Center(
                          child: Text(
                            data.name,
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: 'Qte en Littre',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'veillez saisir la quantité';
                            }
                            return null;
                          },
                          onChanged: (value) => quantiteSend = value,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          height: 65,
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
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                Future<void> arroser() async {
                                  final DocumentSnapshot doc =
                                      await FirebaseFirestore.instance
                                          .collection('posts')
                                          .doc(data.document)
                                          .get();
                                  final String field = doc.get('field');
                                  final String fieldtank = doc.get('fieldtank');
                                  final String urlwrite = doc.get('urlwrite');
                                  final String urlreadtank =
                                      doc.get('urlreadtank');

                                  // Await the http get response, then decode the json-formatted response.
                                  var response =
                                      await http.get(Uri.parse('$urlreadtank'));
                                  var response2 =
                                      await http.get(Uri.parse('$urlwrite'));

                                  if (response.statusCode == 200) {
                                    final json = jsonDecode(response.body);

                                    print('$json');
                                    if (int.parse('$json') <
                                        int.parse(quantiteSend)) {
                                      print(
                                          'vous avez entrer qui est superieur à la quantité du tank');
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                            'veillez entrer une quantité inferieur',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          duration: Duration(seconds: 5),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.blue,
                                          content: Text(
                                            'le champ est bien arrosé',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          duration: Duration(seconds: 5),
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                      print('success');
                                    }
                                  } else {
                                    throw Exception('Failed to load data');
                                  }
                                }

                                arroser();
                              }
                            },
                            child: const Text(
                              'arroser',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //
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

class ErrorValue extends StatelessWidget {
  const ErrorValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)), //this right here
        child: Container(
          height: 200.0,
          width: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Error',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              const Text('Some error occurred'),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Okay',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
