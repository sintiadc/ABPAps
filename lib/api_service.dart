import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model_recipe.dart';

class ApiService {
  final String apiUrl = "http://10.0.2.2:8000/resep/get-recipe"; // Sesuaikan URL API untuk emulator

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
