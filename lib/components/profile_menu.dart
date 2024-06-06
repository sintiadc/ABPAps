import 'package:flutter/material.dart';

import '../../constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    this.press,
    required this.content, // Added content parameter
  }) : super(key: key);

  final String text;
  final VoidCallback? press;
  final Widget content; // Widget to hold the content inside the box

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold, // Set the text to be bold
            ),
          ),
          const SizedBox(height: 10), // Space between text and box
          GestureDetector(
            onTap: press,
            child: Container(
              width: double.infinity, // Make the container expand horizontally
              height: 60, // Set a fixed height for all boxes
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xFF6C7E46)),// Added border
              ),
              child: content, // Content inside the box
            ),
          ),
        ],
      ),
    );
  }
}
