import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detailrecipe.dart'; // Import RecipeDetail widget

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  List<dynamic> _bookmarkedRecipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBookmarkedRecipes();
  }

  Future<void> _fetchBookmarkedRecipes() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/myresep/getRecipeByUserAndBookmark'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _bookmarkedRecipes = json.decode(response.body);
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        // Handle error
        print('Failed to load bookmarked recipes');
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching bookmarked recipes: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
        backgroundColor: const Color(0xFFF5F1EC),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                color: const Color(0xFFF5F1EC),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Bookmarked Recipes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xFF6C7E46),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 3 / 4,
                      ),
                      itemCount: _bookmarkedRecipes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeDetail(recipe: _bookmarkedRecipes[index]),
                              ),
                            );
                          },
                          child: _buildBookmarkItem(_bookmarkedRecipes[index]),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildBookmarkItem(dynamic recipe) {
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
            child: Image.network(
              recipe['picture'],
              width: 100,
              height: 100,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const Icon(Icons.broken_image, size: 100, color: Colors.red);
              },
            ),
          ),
          const SizedBox(height: 10),
          Text(
            recipe['name'],
            style: const TextStyle(
              fontSize: 16,
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
