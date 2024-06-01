import 'package:flutter/material.dart';

class Calories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
