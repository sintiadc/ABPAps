import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecipeDetail extends StatefulWidget {
  final Map<String, dynamic> recipe;

  RecipeDetail({required this.recipe});

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _likeCount = 0;
  bool _liked = false;

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
                  clipBehavior: Clip.antiAlias, // Ensure the image stays within the border
                  height: 200.0,
                  width: 200.0,
                  child: Image.network(
                    widget.recipe['picture'],
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.broken_image, size: 200, color: Colors.red);
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
                          icon: Icon(_liked ? Icons.thumb_up : Icons.thumb_up_alt_outlined),
                          onPressed: () async {
                            setState(() {
                              if (_liked) {
                                _likeCount++;
                              } else {
                                _likeCount++;
                              }
                             
                            });

                            // Send HTTP request to increment like count
                            final response = await http.get(
                              Uri.parse('http://10.0.2.2:8000/resep/tambah-like/${widget.recipe['id']}'),
                            );

                            if (response.statusCode == 200) {
                              // Successfully incremented like count
                              // Update UI or handle response data as needed
                              // Example: Update like count from response data if necessary
                              // final responseData = json.decode(response.body);
                              // _likeCount = responseData['new_like_count'];
                            } else {
                              // Failed to increment like count, handle error
                              print('Failed to increment like count: ${response.statusCode}');
                              // Optionally revert UI state based on failure
                              setState(() {
                                if (_liked) {
                                  _likeCount++;
                                } else {
                                  _likeCount++;
                                }
                               
                              });
                            }
                          },
                        ),

                        
                        Text(
                          '${_likeCount + widget.recipe['like']}',
                          style: TextStyle(fontSize: 16.0),
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
                    for (var ingredient in widget.recipe['ingredients'].split(','))
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
                    for (var instruction in widget.recipe['detail_resep'].split(','))
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
