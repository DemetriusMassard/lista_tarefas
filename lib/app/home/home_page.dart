import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});
  final String title;

  @override
  State<Homepage> createState() => _HomepageStage();
}

class _HomepageStage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
    );
  }
}
