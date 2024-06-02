import 'package:flutter/material.dart';

class MyRecipe extends StatelessWidget {
  const MyRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F1EC),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F1EC),
          title: Row(
            children: [
              Text(
                'My Recipe',
              )
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 9 / 14),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5,
                            offset: Offset(3, 3))
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0), // Add padding only at the top
                        child: SizedBox(
                          height: 200, // Adjust height as needed
                          child: Image.asset(
                            'img/PFPict1.png',
                            fit: BoxFit
                                .cover, // Ensure the image covers the entire space
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "Menu Makanan",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(right: 4.0),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    child: Center(
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 4.0),
                                decoration: BoxDecoration(
                                    color: Color(0xFF6C7E46),
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  child: Center(
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}
