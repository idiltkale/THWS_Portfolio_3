import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ingredients.dart';

class Recipes extends StatefulWidget {
  final String category;

  Recipes({required this.category});

  @override
  _Recipe createState() => _Recipe();
}

class _Recipe extends State<Recipes> {
  List<Map<String, dynamic>> _recipes = [];

  @override
  void initState() {
    super.initState();
    loadAllforRecipes(); 
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/data/mobile-apps-portfolio-03-recipes.json'); 
  }

 List<Map<String, dynamic>> threeRandomRecipes(List<dynamic> allRecipes, String category) {
  var rd = Random();
  var randomVersion = allRecipes
    .where((recipe) => recipe['category'] == category).map((recipe) => recipe as Map<String, dynamic>).toList();

  randomVersion.shuffle(rd); 

  return randomVersion.take(3).toList(); 
}

  void loadAllforRecipes() async {
    final jsonString = await loadJson(); 
    final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    final allRecipes = jsonData['recipes'] as List<dynamic>;
    _recipes = threeRandomRecipes(allRecipes, widget.category); 
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category} recipes',
          style: const TextStyle(fontFamily: 'Rajdhani', fontSize: 30), 
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _recipes.map((recipe) {
            return Expanded(
                
              child:Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.8, 
                      child: Image.network(
                        recipe['image'],
                        fit: BoxFit.cover,
                      ),
                  )),
                  Center(
                     child: Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white, width: 1),
      color: Colors.transparent
      
    ),
                    child: ElevatedButton(
                    
                      style: ElevatedButton.styleFrom(
                        
                        backgroundColor: Colors.transparent,
                        
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Ingredients(
                              recipe_name: recipe['name'], 
                              ingredients: List<String>.from(recipe['ingredients']),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        recipe['name'],
                        style: const TextStyle(
                          fontFamily: 'Rajdhani',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
              )],
              ),
            ));
          }).toList(), 
        ),
      ),
    );
  }
}
