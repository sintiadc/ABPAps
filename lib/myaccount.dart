import 'package:flutter/material.dart';
import 'package:mealmate/edit_myaccount.dart';

import 'components/profile_pic.dart';
import 'components/profile_menu.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F1EC),
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "Email",
              press: () => {},
              content: const Text("johndoe@example.com"), // Example content
            ),
            ProfileMenu(
              text: "Name",
              press: () {},
              content: const Text("John Doe"), // Example content
            ),
            ProfileMenu(
              text: "Username",
              press: () {},
              content: const Text("johndoe"), // Example content
            ),
            ProfileMenu(
              text: "Age",
              press: () {},
              content: const Text("30"), // Example content
            ),
            ProfileMenu(
              text: "Gender",
              press: () {},
              content: const Text("Laki-laki"), // Example content
            ),
            ProfileMenu(
              text: "Body Weight",
              press: () {},
              content: const Text("70 kg"), // Example content
            ),
            ProfileMenu(
              text: "Body Height",
              press: () {},
              content: const Text("180 cm"), // Example content
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EditMyaccount()),
                      );
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit"),
                    backgroundColor: const Color(0xFF6C7E46),
                  ),
                  const SizedBox(width: 16), // Adjust the width as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
