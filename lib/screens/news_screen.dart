import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final String title;
  const NewsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('News Screen')),
      );
  }
}