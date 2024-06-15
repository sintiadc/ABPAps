import 'package:flutter/material.dart';
import 'Bookmark.dart';
import 'myrecipe.dart';
import 'myaccount.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('img/brand.png', width: 80),
        backgroundColor: const Color(0xFFF5F1EC),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'Log Out') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm Logout'),
                      content: Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Logout'),
                          onPressed: () {
                            // Perform logout action
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else if (value == 'My Recipes') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyRecipe(), // Navigate to MyRecipe page
                  ),
                );
              } else if (value == 'Bookmark') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Bookmark(), // Navigate to Bookmark page
                  ),
                );
              } else if (value == 'My Account') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyAccountPage(), // Navigate to MyAccount page
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'My Account',
                  child: Row(
                    children: [
                      Icon(Icons.account_circle, color: Colors.black),
                      SizedBox(width: 10),
                      Text('My Account'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'My Recipes',
                  child: Row(
                    children: [
                      Icon(Icons.book_rounded, color: Colors.black),
                      SizedBox(width: 10),
                      Text('My Recipes'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Bookmark',
                  child: Row(
                    children: [
                      Icon(Icons.bookmark, color: Colors.black),
                      SizedBox(width: 10),
                      Text('Bookmark'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Log Out',
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.black),
                      SizedBox(width: 10),
                      Text('Log Out'),
                    ],
                  ),
                ),
              ];
            },
            icon: Row(
              children: <Widget>[
                Icon(Icons.person),
                SizedBox(width: 5),
                Text('Hi, Sintia', style: TextStyle(color: Colors.black)),
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
                      'Culinary Creations',
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
        Image.asset(imagePath, width: 50),
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
