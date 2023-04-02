import 'package:flutter/material.dart';
import 'package:shamba/pages/home/bottonbar.dart';
// import 'package:shamba/pages/home/home.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width >= 900;
    bool isTab(BuildContext context) =>
        MediaQuery.of(context).size.width >= 600;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width >= 600;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/a2.jfif'),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.4),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Shamba Langu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'une application qui vous permet d\'arroser vos champ à distance avec un seul clic mais aussi d\'approvisionner l\'eau de votre reservoir justement avec simple clique',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const BottonBar(),
                                ));
                              },
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ),
                if (isDesktop(context))
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: Colors.transparent,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
