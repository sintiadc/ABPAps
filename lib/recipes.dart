import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detailrecipe.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  String? _selectedMeal;
  String? _selectedHealth;

  final List<String?> _meals = ['All', 'Breakfast', 'Lunch', 'Dinner'];
  final List<String?> _health = ['All', 'Vegan', 'Vegetarian', 'Gluten-Free'];

  late Future<List<Map<String, dynamic>>> _futureRecipes;

  @override
  void initState() {
    super.initState();
    _futureRecipes = fetchRecipes();
  }

  Future<List<Map<String, dynamic>>> fetchRecipes() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/resep/get-recipe/'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      List<Map<String, dynamic>> recipes = [];

      for (var data in responseData) {
        recipes.add({
          'name': data['name'],
          'calories': data['calories'],
          'ingredients': data['ingredients'],
          'servings': data['servings'],
          'prepTime': data['prep_time'],
          'meal': data['meal'],
          'health': data['health'],
          'image': data['picture'],
          'detail_resep': data['detail_resep'],
        });
      }

      return recipes;
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Filter Recipes',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String?>(
                    decoration: InputDecoration(
                      labelText: 'Meal',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    value: _selectedMeal,
                    items: _meals.map((meal) {
                      return DropdownMenuItem(
                        value: meal,
                        child: Text(meal!),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedMeal = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: DropdownButtonFormField<String?>(
                    decoration: InputDecoration(
                      labelText: 'Health',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    value: _selectedHealth,
                    items: _health.map((health) {
                      return DropdownMenuItem(
                        value: health,
                        child: Text(health!),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedHealth = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _buildRecipeList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeList() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _futureRecipes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final List<Map<String, dynamic>> recipes = snapshot.data!;
          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            recipe['image'],
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('Calories: ${recipe['calories']}'),
                            Text('Servings: ${recipe['servings']}'),
                            Text('Prep Time: ${recipe['prepTime']}'),
                            Text('Meal: ${recipe['meal']}'),
                            Text('Health: ${recipe['health']}'),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeDetail(recipe: recipe),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF6C7E46),
                                ),
                                child: const Text(
                                  'View Details',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
