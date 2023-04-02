import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width >= 700;
    bool isTab(BuildContext context) =>
        MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 900;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isDesktop(context))
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 4,
                height: 200,
                padding: const EdgeInsets.all(50),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/sol.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          const SizedBox(
            width: 10,
          ),
          if (!isDesktop(context))
            Expanded(
              child: Container(
                  child: Column(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Shamba Langu',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/a2.jfif'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: double.infinity,
                          height: 100,
                          child: Image.asset(
                            'assets/images/gdsc.png',
                            fit: BoxFit.cover,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 241, 241, 241)),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Text(
                      'une application qui vous permet d\'arroser vos champ à distance avec un seul clic mais aussi d\'approvisionner l\'eau de votre reservoir justement avec simple clique',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              )),
            ),
          if (isDesktop(context))
            Expanded(
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Shamba Langu',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                'une application qui vous permet d\'arroser vos champ à distance avec un seul clic mais aussi d\'approvisionner l\'eau de votre reservoir justement avec simple clique',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(color: Colors.grey),
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/a2.jfif'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            )
        ],
      ),
    );
  }
}
