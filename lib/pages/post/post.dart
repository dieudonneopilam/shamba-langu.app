import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shamba/pages/post/addpost.dart';
import 'package:shamba/pages/post/arrose.dart';
import 'package:shamba/pages/post/editpost.dart';

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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                width: double.infinity,
                child: Column(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/post.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 100,
                              margin: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['name'],
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 40,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.green),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/arroser',
                                                  arguments: Arguments(
                                                      field: data['field'],
                                                      document: document.id,
                                                      name: data['name'],
                                                      urlread: data['urlread'],
                                                      urlwrite:
                                                          data['urlwrite'],
                                                      urlWriteTankTotalCm: data[
                                                          'urlWriteTankTotalCm'],
                                                      urlWriteTankTotalLitre: data[
                                                          'urlWriteTankTotalLitre'],
                                                      urlreadtank:
                                                          data['urlreadtank']));
                                            },
                                            child: const Text(
                                              'arroser',
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
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
                                                Border.all(color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                context,
                                                '/editpost',
                                                arguments: Arguments(
                                                  field: data['field'],
                                                  document: document.id,
                                                  name: data['name'],
                                                  urlread: data['urlread'],
                                                  urlwrite: data['urlwrite'],
                                                  urlWriteTankTotalCm: data[
                                                      'urlWriteTankTotalCm'],
                                                  urlWriteTankTotalLitre: data[
                                                      'urlWriteTankTotalLitre'],
                                                  urlreadtank:
                                                      data['urlreadtank'],
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'modifier',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
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
                                              style:
                                                  TextStyle(color: Colors.red),
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
        );
      },
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 60, left: 10, right: 10),
  //     width: double.infinity,
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.all(10),
  //           decoration: const BoxDecoration(
  //               // color: Colors.blue,
  //               ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               const Text(
  //                 'All Post',
  //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //               ),
  //               Container(
  //                 height: 40,
  //                 width: 40,
  //                 decoration: const BoxDecoration(
  //                   color: Colors.blue,
  //                   borderRadius: BorderRadius.all(
  //                     Radius.circular(5),
  //                   ),
  //                 ),
  //                 child: IconButton(
  //                   onPressed: () {
  //                     Navigator.of(context).push(MaterialPageRoute(
  //                       builder: (context) => const AddPost(),
  //                     ));
  //                   },
  //                   icon: const Icon(
  //                     Icons.add,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
  //           width: double.infinity,
  //           child: Column(
  //             children: [
  //               Container(
  //                 margin: const EdgeInsets.symmetric(vertical: 20),
  //                 child: Row(
  //                   children: [
  //                     Container(
  //                       height: 80,
  //                       width: 100,
  //                       decoration: BoxDecoration(
  //                         image: const DecorationImage(
  //                             image: AssetImage('assets/images/post.jpg'),
  //                             fit: BoxFit.cover),
  //                         borderRadius: BorderRadius.circular(5),
  //                       ),
  //                     ),
  //                     Expanded(
  //                       child: Container(
  //                         height: 100,
  //                         margin: const EdgeInsets.only(left: 5),
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                           children: [
  //                             Container(
  //                               margin: const EdgeInsets.only(left: 5),
  //                               child: Column(
  //                                 mainAxisAlignment: MainAxisAlignment.start,
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: const [
  //                                   Text(
  //                                     'poste de choux fleur',
  //                                     style: TextStyle(fontSize: 18),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               children: [
  //                                 Expanded(
  //                                   child: Container(
  //                                     height: 40,
  //                                     margin: const EdgeInsets.symmetric(
  //                                         horizontal: 5),
  //                                     decoration: BoxDecoration(
  //                                         border:
  //                                             Border.all(color: Colors.green),
  //                                         borderRadius:
  //                                             BorderRadius.circular(20)),
  //                                     child: TextButton(
  //                                       onPressed: () {
  //                                         Navigator.of(context)
  //                                             .push(MaterialPageRoute(
  //                                           builder: (context) => ArrosePage(),
  //                                         ));
  //                                       },
  //                                       child: const Text(
  //                                         'arroser',
  //                                         style: TextStyle(color: Colors.green),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Expanded(
  //                                   child: Container(
  //                                     height: 40,
  //                                     margin: const EdgeInsets.symmetric(
  //                                         horizontal: 5),
  //                                     decoration: BoxDecoration(
  //                                       border: Border.all(color: Colors.blue),
  //                                       borderRadius: BorderRadius.circular(20),
  //                                     ),
  //                                     child: TextButton(
  //                                       onPressed: () {
  //                                         Navigator.of(context)
  //                                             .push(MaterialPageRoute(
  //                                           builder: (context) => EditPost(),
  //                                         ));
  //                                       },
  //                                       child: const Text(
  //                                         'modifier',
  //                                         style: TextStyle(color: Colors.blue),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Expanded(
  //                                   child: Container(
  //                                     height: 40,
  //                                     margin: const EdgeInsets.symmetric(
  //                                         horizontal: 5),
  //                                     decoration: BoxDecoration(
  //                                         border: Border.all(color: Colors.red),
  //                                         borderRadius:
  //                                             BorderRadius.circular(20)),
  //                                     child: TextButton(
  //                                       onPressed: () {},
  //                                       child: const Text(
  //                                         'supprimer',
  //                                         style: TextStyle(color: Colors.red),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 )
  //                               ],
  //                             )
  //                           ],
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
