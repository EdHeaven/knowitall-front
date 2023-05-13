import 'package:flutter/material.dart';
import 'question-body.dart';

class QuestionScreen extends StatelessWidget {

  static String routeName = '/question';
  const QuestionScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuestionBody();
  }
}