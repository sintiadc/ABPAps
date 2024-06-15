import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detailrecipe.dart'; // Import RecipeDetail widget
import 'Bookmark.dart';
import 'myrecipe.dart';
import 'myaccount.dart';
import 'login.dart';

class Home extends StatefulWidget {
  final int userId; // Tambahkan parameter userId

  const Home({Key? key, required this.userId}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Map<String, dynamic>>> _futureRecipes;

  @override
  void initState() {
    super.initState();
    _futureRecipes = fetchRecipes();
  }

  Future<List<Map<String, dynamic>>> fetchRecipes() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/resep/getPopularRecipe'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> recipes = data.map((item) {
          return {
            'id': item['id'],
            'name': item['name'],
            'picture': item['picture'],
            'calories': item['calories'],
            'ingredients': item['ingredients'],
            'servings': item['servings'],
            'prep_time': item['prep_time'],
            'meal': item['meal'],
            'health': item['health'],
            'detail_resep': item['detail_resep'],
            'like': item['like'],
          };
        }).toList();
        return recipes;
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (error) {
      throw Exception('Error fetching recipes: $error');
    }
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
                      title: const Text('Confirm Logout'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Logout'),
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
              } else if (value == "Log Out") {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Logout'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Logout'),
                          onPressed: () {
                            // Perform logout action
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LoginPage(), // Navigate to MyAccount page
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'My Account',
                  child: Row(
                    children: [
                      Icon(Icons.account_circle, color: Colors.black),
                      SizedBox(width: 10),
                      Text('My Account'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'My Recipes',
                  child: Row(
                    children: [
                      Icon(Icons.book_rounded, color: Colors.black),
                      SizedBox(width: 10),
                      Text('My Recipes'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Bookmark',
                  child: Row(
                    children: [
                      Icon(Icons.bookmark, color: Colors.black),
                      SizedBox(width: 10),
                      Text('Bookmark'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
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
                const Icon(Icons.person),
                const SizedBox(width: 5),
                const Text('Hi, Sintia', style: TextStyle(color: Colors.black)),
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
                      'img/picChildLP1.png',
                      'Access a variety of healthy recipes. Easily create nutritious and delicious meals at home',
                      10,
                    ),
                    const SizedBox(width: 20),
                    _buildServiceItem(
                      'img/picChildLP2.png',
                      'Monitor your caloric intake quickly. Achieve your health goals more effectively',
                      10,
                    ),
                    const SizedBox(width: 20),
                    _buildServiceItem(
                      'img/picChildLP3.png',
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
                    const Text(
                      'Popular Culinary Creations',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF6C7E46),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'We provide various food recipes with high taste with ratings to see popular food recipes. To see food recipes, go to the "Recipes" menu.',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 3, 3, 3),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    FutureBuilder<List<Map<String, dynamic>>>(
                      future: _futureRecipes,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.hasData) {
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0,
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              Map<String, dynamic> recipe = snapshot.data![index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeDetail(recipe: recipe),
                                    ),
                                  );
                                },
                                child: _buildPopularFoodItem(recipe),
                              );
                            },
                          );
                        } else {
                          return const Center(child: Text('No data available'));
                        }
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

  Widget _buildServiceItem(String imagePath, String description, double fontSize) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Image.asset(imagePath, width: 50),
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

  Widget _buildPopularFoodItem(Map<String, dynamic> recipe) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF5F1EC),
        border: Border.all(
          color: const Color(0xFF6C7E46),
          width: 2.0,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetail(recipe: recipe),
                  ),
                );
              },
              child: Image.network(
                recipe['picture'],
                width: 80,
                height: 80,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            recipe['name'],
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
