import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        // ignore: avoid_unnecessary_containers
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(
                      'assets/images/a2.jfif',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Dieudonné Ngwangwa',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: [
                    Colors.red.withOpacity(.6),
                    Colors.red.withOpacity(.4),
                  ],
                ),
              ),
              child: Center(
                  child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )),
            )
          ],
        ));
  }
}
