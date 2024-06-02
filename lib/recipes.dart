import 'package:flutter/material.dart';
import 'detailrecipe.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  String? _selectedMeal;
  String? _selectedHealth;

  final List<String> _meals = ['Breakfast', 'Lunch', 'Dinner'];
  final List<String> _health = ['Vegan', 'Vegetarian', 'Gluten-Free'];

  final List<Map<String, dynamic>> _recipes = [
    {
      'name': 'Vegan Breakfast Burrito',
      'calories': 250,
      'ingredients': 3,
      'servings': 2,
      'prepTime': '15 mins',
      'meal': 'Breakfast',
      'health': 'Vegan',
      'image': 'img/PFPict1.png',
    },
    {
      'name': 'Gluten-Free Pancakes',
      'calories': 300,
      'ingredients': 3,
      'servings': 4,
      'prepTime': '20 mins',
      'meal': 'Breakfast',
      'health': 'Gluten-Free',
      'image': 'img/PFPict2.png',
    },
    {
      'name': 'Keto Lunch Salad',
      'calories': 350,
      'ingredients': 3,
      'servings': 1,
      'prepTime': '10 mins',
      'meal': 'Lunch',
      'health': 'Keto',
      'image': 'img/PFPict3.png',
    },
    {
      'name': 'Vegetarian Dinner Stir-fry',
      'calories': 400,
      'ingredients': 3,
      'servings': 3,
      'prepTime': '25 mins',
      'meal': 'Dinner',
      'health': 'Vegetarian',
      'image': 'img/PFPict1.png',
    },
    {
      'name': 'Snack Bars',
      'calories': 200,
      'ingredients': 3,
      'servings': 5,
      'prepTime': '30 mins',
      'meal': 'Snack',
      'health': 'Vegan',
      'image': 'img/PFPict2.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EC),
      // appBar: AppBar(
      //   title: Text('Recipes'),
      //   automaticallyImplyLeading: false,
      // ),
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
                  child: DropdownButtonFormField<String>(
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
                        child: Text(meal),
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
                  child: DropdownButtonFormField<String>(
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
                        child: Text(health),
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
    List<Map<String, dynamic>> filteredRecipes = _recipes;

    if (_selectedMeal != null) {
      filteredRecipes = filteredRecipes
          .where((recipe) => recipe['meal'] == _selectedMeal)
          .toList();
    }

    if (_selectedHealth != null) {
      filteredRecipes = filteredRecipes
          .where((recipe) => recipe['health'] == _selectedHealth)
          .toList();
    }

    return ListView.builder(
      itemCount: filteredRecipes.length,
      itemBuilder: (context, index) {
        final recipe = filteredRecipes[index];
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
                    child: Image.asset(
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
                      Text('Ingredients: ${recipe['ingredients']} items'),
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
                                builder: (context) =>
                                    RecipeDetail(recipe: recipe),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF6C7E46), // Button color
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
}

void main() {
  runApp(MaterialApp(
    home: Recipes(),
  ));
}
