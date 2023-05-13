import 'package:flutter/material.dart';
import 'signup-body.dart';

class SignUpScreen extends StatelessWidget {

  static String routeName = '/signup';
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignUpBody();
  }
}