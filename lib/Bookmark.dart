import 'package:flutter/material.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
        backgroundColor: const Color(0xFFF5F1EC), // Warna latar belakang AppBar
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF5F1EC),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Bookmarked Recipes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xFF6C7E46),
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 3 / 4, // Rasio aspek kotak bookmark
                ),
                itemCount:
                    6, // Ubah jumlah item sesuai dengan data bookmark Anda
                itemBuilder: (BuildContext context, int index) {
                  return _buildBookmarkItem(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookmarkItem(int index) {
    List<String> titles = [
      'Klean Bowl',
      'Soup Bowl',
      'Salad Bowl',
      'Salad Bowl',
      'Soup Bowl',
      'Klean Bowl',
    ];
    List<String> imagePaths = [
      'img/PFPict1.png',
      'img/PFPict2.png',
      'img/PFPict3.png',
      'img/PFPict3.png',
      'img/PFPict2.png',
      'img/PFPict1.png',
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF5F1EC), // Warna latar belakang kotak
        border: Border.all(
          color: const Color(0xFF6C7E46), // Warna pinggiran kotak
          width: 2.0,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              imagePaths[index % imagePaths.length],
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            titles[index % titles.length],
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold, // Tebalkan teks
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
