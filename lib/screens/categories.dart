import 'package:flutter/material.dart';
import 'recipes.dart';

class Categories extends StatelessWidget {

  final List<String> forTheStaticList = [
    'italian',
    'indian',
    'turkish',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Icon(Icons.restaurant_menu),
        SizedBox(width: 5,),
      
        Text("Cook Book ", style: TextStyle(fontFamily: 'Rajdhani',
        color: Color.fromARGB(255, 122, 77, 77),
         fontWeight: FontWeight.w500,
          fontSize: 40),),
          Icon(Icons.restaurant_menu),
          SizedBox(width: 5,)


      ])),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
          children: forTheStaticList.map((category) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(


                  style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 232, 232, 232), 
                  backgroundColor: const Color.fromARGB(255, 122, 77, 77),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Recipes(category: category)),
                    );
                  },
                       child: Align(
                  alignment: Alignment.bottomRight,
                child: Text(
                      category,
                      style: const TextStyle(
                        
                        fontFamily: 'Rajdhani',
                        color: Color.fromARGB(255, 255, 249, 249),
                         fontWeight: FontWeight.w100,
                        fontSize: 60
                      
        
                      ), 
                  ),
                ),
              ),
            ));
          }).toList(),
        ),
      ),
    );
  }
}
