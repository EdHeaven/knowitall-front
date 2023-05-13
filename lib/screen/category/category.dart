import 'package:flutter/material.dart';
import 'category-body.dart';

class CategoryScreen extends StatelessWidget {

  static String routeName = '/category';
  const CategoryScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CategoryBody();
  }
}