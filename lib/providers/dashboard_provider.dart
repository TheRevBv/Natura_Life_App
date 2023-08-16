import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  IconData middleIcon = Icons.house;

  setMiddleIcon(IconData icon) {
    middleIcon = icon;
    notifyListeners();
  }
}
