import 'package:flutter/material.dart';
import 'package:natura_life/screen.dart';
import 'package:natura_life/screen/product_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    '/Home': (BuildContext context) => const Home(),
    '/Login': (BuildContext context) => const Login(),
    '/Product': (BuildContext context) => const ProductScreen(),
  };

  static const String initialROute = '/Login';

  static onUknownRoute(settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}
