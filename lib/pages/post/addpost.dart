import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();

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
                const Center(
                  child: Text(
                    'Informations Post',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('url'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir url';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    label: Text('url read'),
                    contentPadding: const EdgeInsets.only(left: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez sasisir url read';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    label: Text('url write'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'veillez saisir url write';
                    }
                    return null;
                  },
                  obscureText: true,
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
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('processing')));
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
