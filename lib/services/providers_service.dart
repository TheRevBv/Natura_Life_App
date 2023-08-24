import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:natura_life/models/proveedor.dart';
import 'package:natura_life/utils/constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ProviderService extends ChangeNotifier {
  List<Provider> providers = [];
  late Provider selectedProvider;
  bool isLoading = true;
  bool isSaving = false;
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

  Future<Provider> saveOrUpdateProvider(Provider provider) async {
    isSaving = true;
    notifyListeners();
    print(provider.toJson());
    if (provider.idProveedor == null || provider.idProveedor == 0) {
      final temp = await createProvider(provider);
      isSaving = false;
      notifyListeners();
      return temp;
    } else {
      final temp = await updateProvider(provider);
      isSaving = false;
      notifyListeners();
      return temp;
    }
  }

  Future<Provider> createProvider(Provider provider) async {
    // print(provider.toJson());
    final url = '$_url/proveedores/prov';
    final resp = await http.post(Uri.parse(url),
        headers: _headers, body: provider.toJson());
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp = Provider.fromMap(decodedData);
    providers.add(temp);
    notifyListeners();
    return temp;
  }

  Future<Provider> updateProvider(Provider provider) async {
    final url = '$_url/proveedores/prov/${provider.idProveedor}';
    final resp = await http.put(Uri.parse(url),
        headers: _headers, body: provider.toJson());
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp = Provider.fromMap(decodedData);
    final index = providers
        .indexWhere((element) => element.idProveedor == temp.idProveedor);
    providers[index] = temp;
    notifyListeners();
    return temp;
  }

  Future<int> deleteProvider(int id) async {
    final url = '$_url/proveedores/$id';
    final resp = await http.delete(Uri.parse(url), headers: _headers);
    final index = providers.indexWhere((element) => element.idProveedor == id);
    providers.removeAt(index);
    notifyListeners();
    return resp.statusCode;
  }
}
