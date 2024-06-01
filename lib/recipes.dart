import 'package:flutter/material.dart';

class Recipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
