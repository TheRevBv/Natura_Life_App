import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:natura_life/providers/util_provider.dart';

class APiProvider extends ChangeNotifier {
  final String _urlBase = 'https://10.16.12.175:7032/api/';

  List<dynamic> products = [];
  List<dynamic> matter = [];
  List<dynamic> provider = [];

  APiProvider() {
    getMatter();
  }

  Future getProducts() async {
    final String url = '${_urlBase}Producto/1';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as List<dynamic>;
      products = jResponse;
      notifyListeners();
    }
  }

  Future getMatter() async {
    final String url = '${_urlBase}MateriaPrima/1';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as List<dynamic>;
      matter = jResponse;
      notifyListeners();
    }
  }

  Future getProviders() async {
    final String url = '${_urlBase}Proveedor/1';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as List<dynamic>;
      provider = jResponse;
      notifyListeners();
    }
  }
}
