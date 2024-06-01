import 'package:flutter/material.dart';
import 'myrecipe.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'img/brand.png', // Rute gambar
          width: 800, // Lebar gambar
        ),
        backgroundColor: const Color(0xFFF5F1EC),
        actions: <Widget>[
          InkWell(
            onTap: () {
<<<<<<< HEAD
              showMenu(
                context: context,
                position:
                    RelativeRect.fromLTRB(100, 80, 0, 0), // Posisi dropdown
                items: [
                  PopupMenuItem<String>(
                    value: 'My Account',
                    child: Row(
                      children: [
                        Icon(Icons.account_circle,
                            color: Colors.black), // Ikon di sebelah teks
                        SizedBox(width: 10), // Spasi antara ikon dan teks
                        Text('My Account'),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'My Recipes',
                    child: Row(
                      children: [
                        Icon(Icons.book_rounded,
                            color: Colors.black), // Ikon di sebelah teks
                        SizedBox(width: 10), // Spasi antara ikon dan teks
                        Text('My Recipes'),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'Log Out',
                    child: Row(
                      children: [
                        Icon(Icons.logout,
                            color: Colors.black), // Ikon di sebelah teks
                        SizedBox(width: 10), // Spasi antara ikon dan teks
                        Text('Log Out'),
                      ],
                    ),
                  ),
                ],
                elevation: 8.0,
              ).then((value) {
                if (value == 'My Account') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MyAccountPage(), // Ganti dengan halaman yang sesuai
                    ),
                  );
                }
              });
=======
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const MyRecipe(), // Navigasi ke halaman login
                ),
              );
>>>>>>> 30b3b88bdfbd23a47c6bf609012a14c9c414d52d
            },
            child: Row(
              children: <Widget>[
                Icon(Icons.person),
                SizedBox(width: 5), // Spasi antara ikon dan teks
                Text(
                  'Hi, Sintia',
                  style:
                      TextStyle(color: Colors.black), // Teks dengan warna hitam
                ),
                SizedBox(width: 15), // Memberikan spasi di sebelah kanan
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF5F1EC),
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
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
                    'img/Pic1Home.png',
                    width: 150,
                  ),
                ],
              ),
              const SizedBox(height: 50),
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
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildServiceItem(
                      'img/Pic1Home.png',
                      'Access a variety of healthy recipes. Easily create nutritious and delicious meals at home',
                      10,
                    ),
                    SizedBox(width: 20),
                    _buildServiceItem(
                      'img/Pic1Home.png',
                      'Monitor your caloric intake quickly. Achieve your health goals more effectively',
                      10,
                    ),
                    SizedBox(width: 20),
                    _buildServiceItem(
                      'img/Pic1Home.png',
                      'Create a healthy menu. Choose favorite ingredients and adjust nutritional proportion.',
                      10,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Popular Food',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF6C7E46),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'We provide various food recipes with high taste with ratings to see popular food recipes. To see food recipes, go to the "Recipes" menu.',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 3, 3, 3),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return _buildPopularFoodItem(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceItem(
      String imagePath, String description, double fontSize) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Image.asset(
          imagePath,
          width: 50,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 115,
          child: Text(
            description,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildPopularFoodItem(int index) {
    List<String> titles = [
      'Food 1',
      'Food 2',
      'Food 3',
      'Food 4',
      'Food 5',
      'Food 6',
      'Food 7',
      'Food 8',
      'Food 9'
    ];
    List<String> imagePaths = [
      'img/Pic1Home.png',
      'img/Pic1Home.png',
      'img/Pic1Home.png',
      'img/Pic1Home.png',
      'img/Pic1Home.png',
      'img/Pic1Home.png',
      'img/Pic1Home.png',
      'img/Pic1Home.png',
      'img/Pic1Home.png',
    ];

    return Column(
      children: [
        Image.asset(
          imagePaths[index % imagePaths.length],
          width: 80,
          height: 80,
        ),
        SizedBox(height: 10),
        Text(
          titles[index % titles.length],
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
    );
  }
}

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Center(
        child: Text('This is the My Account page'),
      ),
    );
  }
}
