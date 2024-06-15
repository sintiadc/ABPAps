import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeDetail extends StatefulWidget {
  final Map<String, dynamic> recipe;

  RecipeDetail({required this.recipe});

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _likeCount = 0;
  bool _liked = false;
  bool _bookmarked = false;

  @override
  void initState() {
    super.initState();
    _likeCount = widget.recipe['like'];
    _liked = false;
    _bookmarked = widget.recipe['bookmarked'] ?? false;
  }

  Future<void> _toggleLike() async {
    setState(() {
      _liked = !_liked;
      _likeCount = _likeCount + 1;
    });

    final response = await http.get(
      Uri.parse(
          'http://10.0.2.2:8000/resep/tambah-like/${widget.recipe['id']}'),
    );

    if (response.statusCode != 200) {
      setState(() {
        _liked = !_liked;
      });
      print('Increment like count: ${response.statusCode}');
    }
  }

  Future<void> _toggleBookmark() async {
    setState(() {
      _bookmarked = !_bookmarked;
    });

    final url = 'http://10.0.2.2:8000/api/v1/myresep/addBookmark';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'user_id': 1,  // Ganti dengan user_id yang sesuai
        'resep_id': widget.recipe['id']
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _bookmarked = !_bookmarked;
      });

      final responseData = json.decode(response.body);
      _showPopupMessage('Bookmark', responseData['message']);
    } else {
      _showPopupMessage('Failed to update bookmark', response.body);
    }
  }

  void _showPopupMessage(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EC),
      appBar: AppBar(
        title: Text(widget.recipe['name']),
        backgroundColor: const Color(0xFF6C7E46),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto di tengah
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  clipBehavior: Clip
                      .antiAlias, // Ensure the image stays within the border
                  height: 200.0,
                  width: 200.0,
                  child: Image.network(
                    widget.recipe['picture'],
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Icon(Icons.broken_image,
                          size: 200, color: Colors.red);
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Kotak putih dengan informasi makanan
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Food Name: ${widget.recipe['name']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Category: ${widget.recipe['health']}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Servings: ${widget.recipe['servings']} sajian',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Prep Time: ${widget.recipe['prep_time']}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(_liked
                              ? Icons.thumb_up
                              : Icons.thumb_up_alt_outlined),
                          onPressed: _toggleLike,
                        ),
                        Text(
                          '$_likeCount',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        IconButton(
                          icon: Icon(_bookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_outline),
                          onPressed: _toggleBookmark,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Kotak putih dengan informasi ingredients
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    for (var ingredient
                        in widget.recipe['ingredients'].split(','))
                      Text(
                        '- $ingredient',
                        style: TextStyle(fontSize: 16.0),
                      ),
                  ],
                ),
              ),
              // Kotak putih dengan informasi instructions
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Instructions',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    for (var instruction
                        in widget.recipe['detail_resep'].split(','))
                      Text(
                        instruction,
                        style: TextStyle(fontSize: 16.0),
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
}
