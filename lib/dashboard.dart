import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'img/brand.png', // Rute gambar
          width: 800, // Lebar gambar
        ),
        backgroundColor: const Color(0xFFF5F1EC),
        actions: const <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.person),
              SizedBox(width: 5), // Spasi antara ikon dan teks
              Text(
                'Hi, Sintia',
                style:
                    TextStyle(color: Colors.black), // Teks dengan warna hitam
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF5F1EC), // Warna latar belakang
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Discover Your Health Secret with MealMate!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xFF6C7E46),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'img/Pic1Home.png', // Rute gambar
                  width: 150, // Lebar gambar
                ),
              ],
            ),
            const SizedBox(height: 50), // Spasi antara bagian atas dan bawah
            const Center(
              child: Text(
                'Our Services',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF6C7E46),
                ),
              ),
            ),
            const SizedBox(height: 20), // Spasi antara judul dan gambar
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildServiceItem(
                    'img/Pic1Home.png',
                    'Access a variety of healthy recipes. Easily create nutritious and delicious meals at home',
                    16, // Font size
                  ),
                  SizedBox(width: 20),
                  _buildServiceItem(
                    'img/Pic1Home.png',
                    'Monitor your caloric intake quickly. Achieve your health goals more effectively',
                    18, // Font size
                  ),
                  SizedBox(width: 20),
                  _buildServiceItem(
                    'img/Pic1Home.png',
                    'Create a healthy menu. Choose favorite ingredients and adjust nutritional proportion.',
                    14, // Font size
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem(
      String imagePath, String description, double fontSize) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 50,
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 115,
          child: Text(
            description,
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
