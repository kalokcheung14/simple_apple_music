import 'package:flutter/material.dart';
import 'dart:math';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 25.0, top: 12.0, bottom: 12.0, right: 8.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Browse Categories',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)
        ),
        Container(
          child: GridView.count(
            childAspectRatio: 10/7.5,
            padding: const EdgeInsets.only(left: 20, right: 20),
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            shrinkWrap: true,
            children: List.generate(20, (index) {
              // Generate random color for category tiles
              Color randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      color: randomColor,
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  footer: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),
                ),
              );
            },),
          ),
        ),
      ],
    ));
  }
}