import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF5F1EC), // Warna latar belakang
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'img/picWelcome.png', // Rute gambar
                  width: 200, // Lebar gambar
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                // Menggunakan Center untuk menengahkan tulisan "Login account"
                child: Text(
                  'Create your account ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFF6C7E46),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 86, 84, 84),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 86, 84, 84),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                // Form box untuk email
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'User Name',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 86, 84, 84),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                // Form box untuk username
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your name',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Age',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 86, 84, 84),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                // Form box untuk age
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your age',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Gender',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 86, 84, 84),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                // Form box untuk gender
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonFormField<String>(
                  value: _selectedGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Select your gender',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Body Weight',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 86, 84, 84),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                // Form box untuk body weight
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your body weight',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Body Height',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 86, 84, 84),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                // Form box untuk body weight
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your body height',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 86, 84, 84),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                // Form box untuk password
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your password',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Confirm Password',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 86, 84, 84),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                // Form box untuk confirm password
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Confirm your password',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Register'),
              ),
              const SizedBox(height: 50),
              const Center(
                // Menggunakan Center untuk menengahkan tulisan "Login account"
                child: Text(
                  'Already have an Account ?  Login',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF6C7E46),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
