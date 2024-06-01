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
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
              )
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 10, 
                  mainAxisSpacing: 10,
                  childAspectRatio: 9/16
                  ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3)
                      )
                    ]
                  ),
                  
                );
              },
            )
          )
        );
  }
}
