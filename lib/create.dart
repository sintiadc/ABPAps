import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  int mealValue = 0;
  int healthValue = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController pictureController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  TextEditingController servingsController = TextEditingController();
  TextEditingController prepTimeController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController detailResepController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Menambahkan listener untuk setiap controller
    nameController.addListener(saveName);
    pictureController.addListener(savePicture);
    caloriesController.addListener(saveCalories);
    servingsController.addListener(saveServings);
    prepTimeController.addListener(savePrepTime);
    ingredientsController.addListener(saveIngredients);
    detailResepController.addListener(saveDetailResep);
  }

  @override
  void dispose() {
    // Membersihkan controller saat widget dihapus
    nameController.dispose();
    pictureController.dispose();
    caloriesController.dispose();
    servingsController.dispose();
    prepTimeController.dispose();
    ingredientsController.dispose();
    detailResepController.dispose();
    super.dispose();
  }

  void saveName() => setState(() {});
  void savePicture() => setState(() {});
  void saveCalories() => setState(() {});
  void saveServings() => setState(() {});
  void savePrepTime() => setState(() {});
  void saveIngredients() => setState(() {});
  void saveDetailResep() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EC),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                'Nutrient-Rich Menu by You',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'img/picCamera.png', // Ganti dengan path gambar Anda
                width: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                'Add recipe photo',
                style: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(255, 97, 97, 97),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Input fields
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: pictureController,
                    decoration: InputDecoration(
                      labelText: 'Image URL',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: caloriesController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Calories',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: servingsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Servings',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: prepTimeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Preparation Time',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: ingredientsController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Ingredients',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: detailResepController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Instructions',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Meal Radio Button
                  // Health Radio Button
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  postRecipe();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF6C7E46),
                ),
                child: Text('Upload'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> postRecipe() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/v1/resep/create-recipe');
    final response = await http.post(
      url,
      body: json.encode({
        "name": nameController.text,
        "picture": pictureController.text,
        "calories": int.tryParse(caloriesController.text) ?? 0,
        "ingredients": ingredientsController.text,
        "servings": int.tryParse(servingsController.text) ?? 0,
        "prep_time": prepTimeController.text,
        "meal": mealValue == 0 ? 'Breakfast' : mealValue == 1 ? 'Lunch' : 'Dinner',
        "health": healthValue == 0 ? 'Healthy' : healthValue == 1 ? 'Normal' : 'Not healthy',
        "detail_resep": detailResepController.text,
        "like": 0,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Recipe created successfully');
    } else {
      throw Exception('Failed to create recipe');
    }
  }
}
