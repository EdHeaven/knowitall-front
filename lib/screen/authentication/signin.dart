import 'package:flutter/material.dart';
import 'signin-body.dart';

class SignInScreen extends StatelessWidget {

  static String routeName = '/signin';
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignInBody();
  }
}