import 'package:flutter/material.dart';

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto di tengah
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(widget.recipe['image']),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200.0,
                width: 200.0,
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
                    'Prep Time: ${widget.recipe['prepTime']}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(_liked
                            ? Icons.thumb_up
                            : Icons.thumb_up_alt_outlined),
                        onPressed: () {
                          setState(() {
                            if (_liked) {
                              _likeCount--;
                            } else {
                              _likeCount++;
                            }
                            _liked = !_liked;
                          });
                        },
                      ),
                      Text(
                        '$_likeCount',
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
              width: double
                  .infinity, // Mengatur lebar menjadi infinity agar mengisi sepanjang layar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize:
                    MainAxisSize.max, // Menetapkan mainAxisSize menjadi max
                children: [
                  Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '- Ingredient 1',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    '- Ingredient 2',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    '- Ingredient 3',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  // Tambahkan Text sesuai dengan jumlah ingredients yang dimiliki
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
              width: double
                  .infinity, // Mengatur lebar menjadi infinity agar mengisi sepanjang layar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize:
                    MainAxisSize.max, // Menetapkan mainAxisSize menjadi max
                children: [
                  Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '1. Instruction 1',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    '2. Instruction 2',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    '3. Instruction 3',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  // Tambahkan Text sesuai dengan jumlah instruksi yang dimiliki
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
