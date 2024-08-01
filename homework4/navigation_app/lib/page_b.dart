import 'package:flutter/material.dart';
import 'package:navigation_app/page_y.dart';

class PageB extends StatefulWidget {
  const PageB({super.key});

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "PAGE B",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageY()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text(
                "GO > Y",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
