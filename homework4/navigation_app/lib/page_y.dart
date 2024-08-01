import 'package:flutter/material.dart';

class PageY extends StatefulWidget {
  const PageY({super.key});

  @override
  State<PageY> createState() => _PageYState();
}

class _PageYState extends State<PageY> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: const Text(
          "PAGE Y",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: const Center(),
    );
  }
}
