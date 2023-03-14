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

  List<Widget> ListPages = <Widget>[
    const HomePage(),
    const PostsPage(),
    const Tankspage(),
    const Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: ListPages[_selectIndex],
        ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: const BoxDecoration(
            border: Border(),
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: BottomNavigationBar(
            unselectedLabelStyle: const TextStyle(color: Colors.white),
            selectedIconTheme: const IconThemeData(size: 30),
            currentIndex: _selectIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
            backgroundColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 25,
                  ),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 25,
                  ),
                  label: 'post'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 25,
                  ),
                  label: 'tank'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_box,
                    color: Colors.white,
                    size: 25,
                  ),
                  label: 'profil'),
            ],
          ),
        ));
  }
}
