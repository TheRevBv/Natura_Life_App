import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:natura_life/providers/util_provider.dart';

class APiProvider extends ChangeNotifier {
  final String _urlBase = 'http://192.168.147.53:7032/api/';

  List<dynamic> products = [];
  List<dynamic> matter = [];

  Future getProducts() async {
    //Todavia nosta xd
    final String url = '${_urlBase}';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
  }

  Future getMatter() async {
    final String url = '${_urlBase}MateriaPrima/1';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as Map;
      matter = jResponse['results'];
      notifyListeners();
    }
  }
}
