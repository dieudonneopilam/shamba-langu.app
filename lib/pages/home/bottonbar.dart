import 'package:flutter/material.dart';
import 'package:shamba/pages/home/home.dart';
import 'package:shamba/pages/post/post.dart';
import 'package:shamba/pages/profil/profil.dart';
import 'package:shamba/pages/tank/tank.dart';

class BottonBar extends StatefulWidget {
  const BottonBar({super.key});

  @override
  State<BottonBar> createState() => _BottonBarState();
}

class _BottonBarState extends State<BottonBar> {
  int _selectIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  List<Widget> listPages = <Widget>[
    const HomePage(),
    const PostsPage(),
    const Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: listPages[_selectIndex],
        )),
        bottomNavigationBar: Container(
          height: 70,
          decoration: const BoxDecoration(
            border: Border(),
            color: Color.fromARGB(255, 42, 53, 62),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            selectedIconTheme: const IconThemeData(size: 30),
            currentIndex: _selectIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
            backgroundColor: const Color.fromARGB(255, 42, 53, 62),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedFontSize: 16,
            unselectedFontSize: 10,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 25,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.podcasts,
                    color: Colors.white,
                    size: 25,
                  ),
                  label: 'post'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 25,
                ),
                label: 'profil',
              ),
            ],
          ),
        ));
  }
}
