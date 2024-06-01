import 'package:flutter/material.dart';
import 'myrecipe.dart';
import 'myaccount.dart';
import 'logout_confirmation_popup.dart'; // Import file popup logout

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'img/brand.png', // Rute gambar
          width: 80, // Lebar gambar
        ),
        backgroundColor: const Color(0xFFF5F1EC),
        actions: <Widget>[
          InkWell(
            onTap: () {
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
                } else if (value == 'My Recipes') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const MyRecipe(), // Navigasi ke halaman MyRecipe
                    ),
                  );
                } else if (value == 'Log Out') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return LogoutConfirmationPopup(); // Menampilkan popup logout
                    },
                  ).then((logoutConfirmed) {
                    if (logoutConfirmed == true) {
                      // Lakukan proses logout di sini
                    }
                  });
                }
              });
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
                  SizedBox(width: 10),
                  Image.asset(
                    'img/Pic1Home.png',
                    width: 150,
                  ),
                ],
              ),
              SizedBox(height: 50),
              Center(
                child: Text(
                  'Our Services',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF6C7E46),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildServiceItem(
                      'img/picChildLP1.png',
                      'Access a variety of healthy recipes. Easily create nutritious and delicious meals at home',
                      10,
                    ),
                    SizedBox(width: 20),
                    _buildServiceItem(
                      'img/picChildLP2.png',
                      'Monitor your caloric intake quickly. Achieve your health goals more effectively',
                      10,
                    ),
                    SizedBox(width: 20),
                    _buildServiceItem(
                      'img/picChildLP3.png',
                      'Create a healthy menu. Choose favorite ingredients and adjust nutritional proportion.',
                      10,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
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
                    SizedBox(height: 10),
                    Text(
                      'We provide various food recipes with high taste with ratings to see popular food recipes. To see food recipes, go to the "Recipes" menu.',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 3, 3, 3),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
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
        SizedBox(height: 10),
        Image.asset(
          imagePath,
          width: 50,
        ),
        SizedBox(height: 10),
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
      'Klean Bowl',
      'Soup Bowl',
      'Salad Bowl',
      'Salad Bowl',
      'Soup Bowl',
      'Klean Bowl',
      'Klean Bowl',
      'Soup Bowl',
      'Salad Bowl'
    ];
    List<String> imagePaths = [
      'img/PFPict1.png',
      'img/PFPict2.png',
      'img/PFPict3.png',
      'img/PFPict3.png',
      'img/PFPict2.png',
      'img/PFPict1.png',
      'img/PFPict1.png',
      'img/PFPict2.png',
      'img/PFPict3.png',
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
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              imagePaths[index % imagePaths.length],
              width: 80,
              height: 80,
            ),
          ),
          SizedBox(height: 10),
          Text(
            titles[index % titles.length],
            style: TextStyle(
              fontSize: 12,
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
