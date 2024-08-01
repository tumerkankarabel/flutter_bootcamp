import 'package:flutter/material.dart';
import 'package:navigation_app/page_b.dart';

class PageA extends StatefulWidget {
  const PageA({super.key});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text("PAGE A"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageB()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text(
                "GO > B",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}