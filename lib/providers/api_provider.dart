import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:natura_life/providers/login_provider.dart';
import 'package:natura_life/providers/util_provider.dart';
import 'package:natura_life/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APiProvider extends ChangeNotifier {
  final String _urlBase = Constants.apiUrl;

  List<dynamic> products = [];

  APiProvider() {
    getProducts();
    // getMatter();
  }

  Future login({required LoginFormProvider lfp}) async {
    final prefs = await SharedPreferences.getInstance();
    final String url = '$_urlBase/Auth/login';
    final response = await UtilProvider.rtp.bodyHTTP(urlBase: url, lfp: lfp);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as Map;
      prefs.setString('IdUsuario', '${jResponse['id']}');
      var usuario = jResponse['usuario'] as Map;
      var rol = usuario['roles'] as List<dynamic>;
      prefs.setString('CorreoUsuario', usuario['correo']);
      prefs.setString('RolUsuario', rol[0]['nombre']);
      prefs.setString('NombreUsuario', usuario['nombre']);
      prefs.setString('ApellidosUsuario', usuario['apellido']);
      prefs.setString('Token', jResponse['token']);
      return 'OK';
    }
    notifyListeners();
    return response.body;
  }

  Future getProducts() async {
    final String url = '$_urlBase/Productos';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as List<dynamic>;
      products = jResponse;
      notifyListeners();
    }
  }

  Future deleteProduct(int id) async {
    final String url = '$_urlBase/Productos/$id';
    final response = await UtilProvider.rtp.deleteHTTP(id: id, urlBase: url);
    if (response.statusCode == 200) {
      return 'OK';
    } else {
      return 'ERROR';
    }
  }
}
