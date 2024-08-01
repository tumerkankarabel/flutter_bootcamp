import 'package:flutter/material.dart';
import 'package:navigation_app/page_a.dart';
import 'package:navigation_app/page_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "HOMEPAGE",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageA()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text(
                "GO > A",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageX()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text(
                "GO > X",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
