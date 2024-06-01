import 'package:flutter/material.dart';

class Recipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EC),
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: Center(
        child: Text(
          'Welcome to Recipes Page!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
