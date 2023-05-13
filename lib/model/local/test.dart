import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'question.dart';

class Test {
  final String testName;
  final List<Question> questions;

  Test({
    required this.questions,
    required this.testName,
  });
}