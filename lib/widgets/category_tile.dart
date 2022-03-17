import 'package:flutter/material.dart';
import 'dart:math';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    @required this.categoryName,
  }) : super(key: key);

  final String? categoryName;

  @override
  Widget build(BuildContext context) {
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
          child: Text(
            categoryName ?? "",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}