import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  final String recipe_name; 

  final List<String> ingredients; 

  Ingredients({required this.recipe_name, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe_name, 

          style: const TextStyle(
            fontFamily: 'Rajdhani',fontSize: 30,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
      final ingredient = ingredients[index]; 

          return Column(
            children: [
              
              ListTile(
                title: Text(
                  ingredient,
                  style: const TextStyle( fontFamily: 'Rajdhani', fontSize: 25,),
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 122, 77, 77),
                thickness: 1, 

              ),
            ],
          );
        },
      ),
    );
  }
}
