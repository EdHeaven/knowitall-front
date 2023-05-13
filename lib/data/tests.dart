import 'package:flutter/material.dart';
import 'package:knowitall/data/questions.dart';
import 'package:knowitall/model/local/test.dart';

final tests = <Test>[
  Test(
    questions: questions,
    testName: 'Страны',
  ),
  Test(
    questions: questions,
    testName: 'Реки',
  ),
  Test(
    questions: questions,
    testName: 'Азия',
  ),
  Test(
    questions: questions,
    testName: 'Климатические зоны',
  ),
  Test(
    questions: questions,
    testName: 'Озёра',
  ),
];