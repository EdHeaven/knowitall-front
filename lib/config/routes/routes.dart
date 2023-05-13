import 'package:flutter/widgets.dart';
import 'package:knowitall/screen/screen.dart';

final Map<String, WidgetBuilder> routes = {
  Nav.routeName : (context) => const Nav(),
  WelcomeScreen.routeName : (context) => const WelcomeScreen(),
  HomeScreen.routeName : (context) => const HomeScreen()
};