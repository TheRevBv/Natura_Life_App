import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:natura_life/models/proveedor.dart';
import 'package:natura_life/utils/constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ProviderService extends ChangeNotifier {
  List<Provider> providers = [];
  // final prefs = SharedPreferences.getInstance();
  final String _url = Constants.apiUrl;
  final Map<String, String> _headers = Constants.headers;

  ProviderService() {
    getProviders();
  }

  Future<List<Provider>> getProviders() async {
    final url = '$_url/proveedores';
    final resp = await http.get(Uri.parse(url), headers: _headers);
    final List<dynamic> decodedData = json.decode(resp.body);
    decodedData.forEach((provider) {
      final temp = Provider.fromMap(provider);
      providers.add(temp);
    });
    notifyListeners();
    return providers;
  }

  Future<Provider> getProviderById(int id) async {
    final url = '$_url/proveedores/$id';
    final resp = await http.get(Uri.parse(url), headers: _headers);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp = Provider.fromMap(decodedData);
    notifyListeners();
    return temp;
  }

  Future<Provider> createProvider(Provider provider) async {
    final url = '$_url/proveedores';
    final resp = await http.post(Uri.parse(url),
        headers: _headers, body: provider.toJson());
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp = Provider.fromMap(decodedData);
    notifyListeners();
    return temp;
  }

  Future<Provider> updateProvider(Provider provider) async {
    final url = '$_url/proveedores/${provider.idProveedor}';
    final resp = await http.put(Uri.parse(url),
        headers: _headers, body: provider.toJson());
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp = Provider.fromMap(decodedData);
    notifyListeners();
    return temp;
  }

  Future<int> deleteProvider(int id) async {
    final url = '$_url/proveedores/$id';
    final resp = await http.delete(Uri.parse(url), headers: _headers);
    notifyListeners();
    return json.decode(resp.body);
  }
}
