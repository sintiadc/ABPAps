import 'package:flutter/material.dart';

class Calories extends StatefulWidget {
  @override
  _CaloriesState createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  int gender = 1; // 1 for male, 2 for female
  double bmr = 0;
  double tdee = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EC),
      // appBar: AppBar(
      //   title: Text('Calories'), // Mengganti judul AppBar
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            Center(
              child: Text(
                'Calorie Calculator', // Teks di atas tengah
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Image.asset(
              'img/calories.png',
              width: 150.0,
              height: 150.0,
            ),
            SizedBox(height: 10.0),
            Text(
              'Calculate your current daily calorie needs accurately efficiently to help you achieve your health goals effectively',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Body Weight (kg)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Body Height (cm)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 1,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value as int;
                    });
                  },
                ),
                Text('Male'),
                Radio(
                  value: 2,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value as int;
                    });
                  },
                ),
                Text('Female'),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                calculateTDEE();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF6C7E46),
              ),
              child: Text('Calculate Now'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Result',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              'BMR: ${bmr.toStringAsFixed(2)} kcal',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'TDEE: ${tdee.toStringAsFixed(2)} kcal',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Basal Metabolic Rate (BMR) is the number of calories your body needs to maintain basic physiological functions at rest. Total Daily Energy Expenditure (TDEE) is the total number of calories your body needs in a day, including BMR and additional calories burned through physical activity.',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateTDEE() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;
    int age = int.tryParse(ageController.text) ?? 0;

    if (weight > 0 && height > 0 && age > 0) {
      double bmr = calculateBMR(weight, height, age);
      double activityMultiplier = getActivityMultiplier();
      double tdee = bmr * activityMultiplier;

      setState(() {
        this.bmr = bmr;
        this.tdee = tdee;
      });
    }
  }

  double calculateBMR(double weight, double height, int age) {
    if (gender == 1) {
      // Male
      return 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      // Female
      return 10 * weight + 6.25 * height - 5 * age - 161;
    }
  }

  double getActivityMultiplier() {
    // Sedentary
    if (gender == 1) {
      // Male
      return 1.2;
    } else {
      // Female
      return 1.2;
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Calories(),
  ));
}
