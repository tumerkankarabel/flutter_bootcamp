import 'package:flutter/material.dart';
import 'package:navigation_app/page_y.dart';

class PageX extends StatefulWidget {
  const PageX({super.key});

  @override
  State<PageX> createState() => _PageXState();
}

class _PageXState extends State<PageX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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
          "PAGE X",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey,
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
