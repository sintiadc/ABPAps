import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditRecipe extends StatefulWidget {
  final Map<String, dynamic> recipe;

  const EditRecipe({Key? key, required this.recipe}) : super(key: key);

  @override
  _EditRecipeState createState() => _EditRecipeState();
}

class _EditRecipeState extends State<EditRecipe> {
  late TextEditingController _titleController;
  late TextEditingController _servingsController;
  late TextEditingController _prepTimeController;
  late TextEditingController _caloriesController;
  late TextEditingController _mealController;
  late TextEditingController _healthController;
  late TextEditingController _ingredientsController;
  late TextEditingController _instructionsController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with current recipe data
    _titleController = TextEditingController(text: widget.recipe['name']);
    _servingsController = TextEditingController(text: widget.recipe['servings'].toString());
    _prepTimeController = TextEditingController(text: widget.recipe['prep_time'].toString());
    _caloriesController = TextEditingController(text: widget.recipe['calories'].toString());
    _mealController = TextEditingController(text: widget.recipe['meal']);
    _healthController = TextEditingController(text: widget.recipe['health']);
    _ingredientsController = TextEditingController(text: widget.recipe['ingredients']);
    _instructionsController = TextEditingController(text: widget.recipe['detail_resep']);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _servingsController.dispose();
    _prepTimeController.dispose();
    _caloriesController.dispose();
    _mealController.dispose();
    _healthController.dispose();
    _ingredientsController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  Future<void> saveRecipe() async {
    final updatedRecipe = {
      'name': _titleController.text,
      'servings': int.tryParse(_servingsController.text) ?? 0,
      'prep_time': _prepTimeController.text,
      'calories': int.tryParse(_caloriesController.text) ?? 0,
      'meal': _mealController.text,
      'health': _healthController.text,
      'ingredients': _ingredientsController.text,
      'detail_resep': _instructionsController.text,
    };

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/v1/resep/edit-recipe/${widget.recipe['id']}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(updatedRecipe),
      );

      if (response.statusCode == 200) {
        Navigator.pop(context, true); // Return to previous screen with success indication
      } else {
        // Handle the error
        print('Failed to update recipe');
      }
    } catch (error) {
      print('Error updating recipe: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EC),
      appBar: AppBar(
        title: const Text('Edit Recipe'),
        backgroundColor: const Color(0xFFF5F1EC),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF5F1EC),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Nutrient-Rich Menu by You',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'img/picCamera.png', // Replace with your image path
                width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              const Text(
                'Add recipe photo',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 97, 97, 97),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Enter Recipe Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Servings',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _servingsController,
                    decoration: InputDecoration(
                      labelText: 'Input portion',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Prep Time',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _prepTimeController,
                    decoration: InputDecoration(
                      labelText: 'Input the Serving Duration',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Calories',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _caloriesController,
                    decoration: InputDecoration(
                      labelText: 'Input the Number of Calories',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Meal',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _mealController,
                    decoration: InputDecoration(
                      labelText: 'Enter Meal Type (e.g., Breakfast, Lunch, Dinner)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Health',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _healthController,
                    decoration: InputDecoration(
                      labelText: 'Enter Health Type (e.g., Healthy, Normal, Not healthy)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _ingredientsController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Enter Ingredients',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true, // Enable background color for the form
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _instructionsController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Enter Instructions',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true, // Enable background color for the form
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: saveRecipe,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF6C7E46),
                    ),
                    child: const Text('Save'),
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
