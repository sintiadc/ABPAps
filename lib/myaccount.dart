import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'edit_myaccount.dart';
import 'components/profile_pic.dart';
import 'components/profile_menu.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  Map<String, dynamic>? userProfile;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/user/1/'));
      if (response.statusCode == 200) {
        setState(() {
          userProfile = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (error) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F1EC),
        title: const Text("Profile"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : isError
              ? const Center(child: Text("Error loading profile data"))
              : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      const ProfilePic(),
                      const SizedBox(height: 20),
                      ProfileMenu(
                        text: "Email",
                        press: () {},
                        content: Text(userProfile?['email'] ?? 'N/A'),
                      ),
                      ProfileMenu(
                        text: "Name",
                        press: () {},
                        content: Text(userProfile?['name'] ?? 'N/A'),
                      ),
                      ProfileMenu(
                        text: "Username",
                        press: () {},
                        content: Text(userProfile?['username'] ?? 'N/A'),
                      ),
                      ProfileMenu(
                        text: "Age",
                        press: () {},
                        content: Text('${userProfile?['umur'] ?? 'N/A'}'),
                      ),
                      ProfileMenu(
                        text: "Gender",
                        press: () {},
                        content: Text(userProfile?['jenis_kelamin'] ?? 'N/A'),
                      ),
                      ProfileMenu(
                        text: "Body Weight",
                        press: () {},
                        content: Text('${userProfile?['berat_badan'] ?? 'N/A'} kg'),
                      ),
                      ProfileMenu(
                        text: "Body Height",
                        press: () {},
                        content: Text('${userProfile?['tinggi_badan'] ?? 'N/A'} cm'),
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
                                  MaterialPageRoute(builder: (context) => const EditMyAccount()), // Correct class name here
                                );
                              },
                              icon: const Icon(Icons.edit),
                              label: const Text("Edit"),
                              backgroundColor: const Color(0xFF6C7E46),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
