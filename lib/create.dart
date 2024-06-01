import 'package:flutter/material.dart';

class Create extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EC),
      appBar: AppBar(
        title: Text('Create Recipe'),
      ),
      body: Center(
        child: Text(
          'Welcome to Create Recipe Page!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
