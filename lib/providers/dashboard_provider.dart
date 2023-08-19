import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardProvider extends ChangeNotifier {
  IconData middleIcon = Icons.house;
  String deleteButtonText = 'Eliminar';
  Map userData = {};

  setDeleteButtonText({required String text}) {
    deleteButtonText = text;
    notifyListeners();
  }

  setMiddleIcon(IconData icon) {
    middleIcon = icon;
    notifyListeners();
  }

  getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    Map data = {
      'id': prefs.getString('IdUsuario'),
      'correo': prefs.getString('CorreoUsuario'),
      'rol': prefs.getString('RolUsuario'),
      'nombre': prefs.getString('NombreUsuario'),
      'apellidos': prefs.getString('ApellidosUsuario'),
      'telefono': prefs.getString('TelefonoUsuario'),
      'direccion': prefs.getString('DireccionUsuario'),
      'token': prefs.getString('Token'),
    };
    userData = data;
    notifyListeners();
  }
}
