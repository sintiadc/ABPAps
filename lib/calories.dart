import 'package:flutter/material.dart';

class Calories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EC),
      appBar: AppBar(
        title: Text('Calories'),
      ),
      body: Center(
        child: Text(
          'Welcome to Calories Page!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
