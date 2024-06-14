import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'components/profile_pic.dart';

class EditMyAccount extends StatefulWidget {
  const EditMyAccount({Key? key}) : super(key: key);

  @override
  _EditMyAccountState createState() => _EditMyAccountState();
}

class _EditMyAccountState extends State<EditMyAccount> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> userProfile = {
    "name": "",
    "username": "",
    "email": "",
    "umur": "",
    "jenis_kelamin": "",
    "berat_badan": "",
    "tinggi_badan": ""
  };

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

  Future<void> submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/v1/user/edit'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(userProfile),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully!')),
        );
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error updating profile')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F1EC),
        title: const Text("Edit Profile"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : isError
              ? const Center(child: Text("Error loading profile data"))
              : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Center(child: ProfilePic()),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextField('Email', 'email'),
                              const SizedBox(height: 20),
                              buildTextField('Name', 'name'),
                              const SizedBox(height: 20),
                              buildTextField('Username', 'username'),
                              const SizedBox(height: 20),
                              buildTextField('Age', 'umur'),
                              const SizedBox(height: 20),
                              buildTextField('Gender', 'jenis_kelamin'),
                              const SizedBox(height: 20),
                              buildTextField('Body Weight', 'berat_badan'),
                              const SizedBox(height: 20),
                              buildTextField('Body Height', 'tinggi_badan'),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FloatingActionButton.extended(
                                    onPressed: submitForm,
                                    icon: const Icon(Icons.save),
                                    label: const Text("Save"),
                                    backgroundColor: const Color(0xFF6C7E46),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget buildTextField(String label, String field) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            initialValue: userProfile[field]?.toString() ?? '',
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            onSaved: (value) {
              userProfile[field] = value;
            },
          ),
        ],
      ),
    );
  }
}
