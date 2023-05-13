import 'package:flutter/material.dart';
import 'profile-body.dart';

class ProfileScreen extends StatelessWidget {

  static String routeName = '/profile';
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileBody();
  }
}