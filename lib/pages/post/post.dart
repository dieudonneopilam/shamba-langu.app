import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shamba/pages/post/addpost.dart';
import 'package:shamba/pages/post/arrose.dart';
import 'package:shamba/pages/post/editpost.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final Stream<QuerySnapshot> posts =
      FirebaseFirestore.instance.collection('posts').snapshots();
  @override
  Widget build(BuildContext context) {
    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width >= 700;
    bool isTab(BuildContext context) =>
        MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 900;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width < 600;
    return StreamBuilder<QuerySnapshot>(
      stream: posts,
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isDesktop(context))
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 6,
                    padding: const EdgeInsets.all(50),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/a2.jfif',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                width: 10,
              ),
              if (isDesktop(context))
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              // color: Colors.blue,
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'All Post',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const AddPost();
                                        },
                                        fullscreenDialog: true,
                                      ),
                                    );
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
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          width: double.infinity,
                          child: Column(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/post.jpg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 5),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data['name'],
                                                    style: const TextStyle(
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 40,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.green),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Future<void>
                                                            arroser() async {
                                                          // final String field = doc.get('field');
                                                          // final String fieldtank = doc.get('fieldtank');
                                                          final String
                                                              urlreadtank =
                                                              data[
                                                                  'urlreadtank'];

                                                          // Await the http get response, then decode the json-formatted response.
                                                          var response =
                                                              await http.get(
                                                            Uri.parse(
                                                                '$urlreadtank'),
                                                          );

                                                          if (response
                                                                  .statusCode ==
                                                              200) {
                                                            final json =
                                                                jsonDecode(
                                                                    response
                                                                        .body);
                                                            // ignore: use_build_context_synchronously
                                                            Navigator.pushNamed(
                                                              context,
                                                              '/arroser',
                                                              arguments:
                                                                  Arguments(
                                                                field: data[
                                                                    'field'],
                                                                document:
                                                                    document.id,
                                                                name: data[
                                                                    'name'],
                                                                urlread: data[
                                                                    'urlread'],
                                                                urlwrite: data[
                                                                    'urlwrite'],
                                                                urlWriteTankTotalCm:
                                                                    data[
                                                                        'urlWriteTankTotalCm'],
                                                                urlWriteTankTotalLitre:
                                                                    data[
                                                                        'urlWriteTankTotalLitre'],
                                                                urlreadtank: data[
                                                                    'urlreadtank'],
                                                                valuetank:
                                                                    '$json',
                                                                ValueurlWriteTankTotalCm:
                                                                    '',
                                                                ValueurlWriteTankTotalLitre:
                                                                    '',
                                                              ),
                                                            );
                                                          } else {
                                                            throw Exception(
                                                                'Failed to load data');
                                                          }
                                                        }

                                                        arroser();
                                                      },
                                                      child: const Text(
                                                        'arroser',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.green),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 40,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          '/editpost',
                                                          arguments: Arguments(
                                                            field:
                                                                data['field'],
                                                            document:
                                                                document.id,
                                                            name: data['name'],
                                                            urlread:
                                                                data['urlread'],
                                                            urlwrite: data[
                                                                'urlwrite'],
                                                            urlWriteTankTotalCm:
                                                                data[
                                                                    'urlWriteTankTotalCm'],
                                                            urlWriteTankTotalLitre:
                                                                data[
                                                                    'urlWriteTankTotalLitre'],
                                                            urlreadtank: data[
                                                                'urlreadtank'],
                                                            valuetank: data[
                                                                'urlreadtank'],
                                                            ValueurlWriteTankTotalCm:
                                                                data[
                                                                    'valueTotalCm'],
                                                            ValueurlWriteTankTotalLitre:
                                                                data[
                                                                    'ValueTotallittre'],
                                                          ),
                                                        );
                                                      },
                                                      child: const Text(
                                                        'modifier',
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 40,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.red),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'supprimer',
                                                        style: TextStyle(
                                                            color: Colors.red),
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
                      ],
                    ),
                  ),
                ),
              if (!isDesktop(context))
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              // color: Colors.blue,
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'All Post',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const AddPost();
                                        },
                                        fullscreenDialog: true,
                                      ),
                                    );
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
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          width: double.infinity,
                          child: Column(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/post.jpg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 5),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data['name'],
                                                    style: const TextStyle(
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 40,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.green),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Future<void>
                                                            arroser() async {
                                                          // final String field = doc.get('field');
                                                          // final String fieldtank = doc.get('fieldtank');
                                                          final String
                                                              urlreadtank =
                                                              data[
                                                                  'urlreadtank'];

                                                          // Await the http get response, then decode the json-formatted response.
                                                          var response =
                                                              await http.get(
                                                            Uri.parse(
                                                                '$urlreadtank'),
                                                          );

                                                          if (response
                                                                  .statusCode ==
                                                              200) {
                                                            final json =
                                                                jsonDecode(
                                                                    response
                                                                        .body);
                                                            // ignore: use_build_context_synchronously
                                                            Navigator.pushNamed(
                                                              context,
                                                              '/arroser',
                                                              arguments:
                                                                  Arguments(
                                                                field: data[
                                                                    'field'],
                                                                document:
                                                                    document.id,
                                                                name: data[
                                                                    'name'],
                                                                urlread: data[
                                                                    'urlread'],
                                                                urlwrite: data[
                                                                    'urlwrite'],
                                                                urlWriteTankTotalCm:
                                                                    data[
                                                                        'urlWriteTankTotalCm'],
                                                                urlWriteTankTotalLitre:
                                                                    data[
                                                                        'urlWriteTankTotalLitre'],
                                                                urlreadtank: data[
                                                                    'urlreadtank'],
                                                                valuetank:
                                                                    '$json',
                                                                ValueurlWriteTankTotalCm:
                                                                    '',
                                                                ValueurlWriteTankTotalLitre:
                                                                    '',
                                                              ),
                                                            );
                                                          } else {
                                                            throw Exception(
                                                                'Failed to load data');
                                                          }
                                                        }

                                                        arroser();
                                                      },
                                                      child: const Text(
                                                        'arroser',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.green),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 40,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          '/editpost',
                                                          arguments: Arguments(
                                                            field:
                                                                data['field'],
                                                            document:
                                                                document.id,
                                                            name: data['name'],
                                                            urlread:
                                                                data['urlread'],
                                                            urlwrite: data[
                                                                'urlwrite'],
                                                            urlWriteTankTotalCm:
                                                                data[
                                                                    'urlWriteTankTotalCm'],
                                                            urlWriteTankTotalLitre:
                                                                data[
                                                                    'urlWriteTankTotalLitre'],
                                                            urlreadtank: data[
                                                                'urlreadtank'],
                                                            valuetank: '',
                                                            ValueurlWriteTankTotalCm:
                                                                data[
                                                                    'valueTotalCm'],
                                                            ValueurlWriteTankTotalLitre:
                                                                data[
                                                                    'ValueTotallittre'],
                                                          ),
                                                        );
                                                      },
                                                      child: const Text(
                                                        'modifier',
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 40,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.red),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'supprimer',
                                                        style: TextStyle(
                                                            color: Colors.red),
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
                      ],
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
