import 'package:flutter/material.dart';
import 'widgets/category_tile.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  static const List<String> categoryList = [
    'Spatial Audio',
    'Hey Siri, Play...',
    'Cantopop',
    'K-Pop',
    'International',
    'Mandopop',
    'J-Pop',
    'Charts',
    'Anime',
    'R&B',
    'Classical',
    'Chill',
    'Hip-Hop/Rap',
    'Sleep',
    'Jazz',
    'Fitness',
    'Rock',
    'Essentials',
    'Feel Good',
    'Romance',
  ];

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
            children: List.generate(categoryList.length, (index) {
              return CategoryTile(categoryName: categoryList[index]);
            },),
          ),
        ),
      ],
    ));
  }
}