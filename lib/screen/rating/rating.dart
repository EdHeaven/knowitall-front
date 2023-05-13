import 'package:flutter/material.dart';
import 'rating-body.dart';

class RatingScreen extends StatelessWidget {

  static String routeName = '/rating';
  const RatingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RatingBody();
  }
}