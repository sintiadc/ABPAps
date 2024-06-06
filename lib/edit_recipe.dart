import 'package:flutter/material.dart';

class EditRecipe extends StatefulWidget {
  @override
  _EditRecipeState createState() => _EditRecipeState();
}

class _EditRecipeState extends State<EditRecipe> {
  int mealValue = 0;
  int healthValue = 0;

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
                    decoration: InputDecoration(
                      labelText: 'Input the Number of Calories',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Meal',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                RadioListTile(
                                  title: const Text('Breakfast'),
                                  value: 0,
                                  groupValue: mealValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      mealValue = value!;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text('Lunch'),
                                  value: 1,
                                  groupValue: mealValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      mealValue = value!;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text('Dinner'),
                                  value: 2,
                                  groupValue: mealValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      mealValue = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Health',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                RadioListTile(
                                  title: const Text('Healthy'),
                                  value: 0,
                                  groupValue: healthValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      healthValue = value!;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text('Normal'),
                                  value: 1,
                                  groupValue: healthValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      healthValue = value!;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text('Not healthy'),
                                  value: 2,
                                  groupValue: healthValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      healthValue = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Amount of ingredients',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
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
                  const SizedBox(height: 20),
                  const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
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
                    onPressed: () {
                      // Handle upload action here
                    },
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
