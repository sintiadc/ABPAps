import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mealmate',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: const Color(0xFFF5F1EC),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 500, // Mengatur lebar gambar menjadi 200
                child: Image.asset(
                  'img/LP.png', // Rute untuk gambar
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const LoginPage(), // Navigasi ke halaman login
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Color(0xFF6C7E46)),
                    ),
                  ),
                  const SizedBox(width: 20), // Memberikan jarak antara tombol
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SignUpPage(), // Navigasi ke halaman sign up
                        ),
                      );
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(color: Color(0xFF6C7E46)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
