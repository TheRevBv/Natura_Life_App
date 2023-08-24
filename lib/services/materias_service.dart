import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:natura_life/models/materia_prima.dart';
import 'package:natura_life/utils/constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MateriasService extends ChangeNotifier {
  List<MateriaPrima> materias = [];
  late MateriaPrima selectedMateria;
  bool isLoading = true;
  bool isSaving = false;
  // final prefs = SharedPreferences.getInstance();
  final String _url = Constants.apiUrl;
  // final String _url = 'http://localhost/API';
  final Map<String, String> _headers = Constants.headers;

  MateriasService() {
    getMaterias();
  }

  Future<List<MateriaPrima>> getMaterias() async {
    final url = '$_url/MateriasPrimas';
    final resp = await http.get(Uri.parse(url), headers: _headers);
    final List<dynamic> decodedData = json.decode(resp.body);
    decodedData.forEach((provider) {
      final temp = MateriaPrima.fromMap(provider);
      materias.add(temp);
    });
    notifyListeners();
    return materias;
  }

  Future<MateriaPrima> getMateriasById(int id) async {
    final url = '$_url/MateriasPrimas/$id';
    final resp = await http.get(Uri.parse(url), headers: _headers);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp = MateriaPrima.fromMap(decodedData);
    notifyListeners();
    return temp;
  }

  Future<MateriaPrima> saveOrUpdateMaterias(MateriaPrima provider) async {
    isSaving = true;
    notifyListeners();
    // print(provider.toJson());
    // ignore: unnecessary_null_comparison
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

  Future<MateriaPrima> createProvider(MateriaPrima provider) async {
    final url = '$_url/MateriasPrimas/';
    final resp = await http.post(Uri.parse(url),
        headers: _headers, body: provider.toJson());
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    // final temp = Provider.fromMap(decodedData);
    materias.add(provider);
    notifyListeners();
    return provider;
  }

  Future<MateriaPrima> updateProvider(MateriaPrima provider) async {
    final url = '$_url/MateriasPrimas/${provider.idProveedor}';
    final resp = await http.put(Uri.parse(url),
        headers: _headers, body: provider.toJson());
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp = MateriaPrima.fromMap(decodedData);
    final index = materias
        .indexWhere((element) => element.idProveedor == temp.idProveedor);
    materias[index] = temp;
    notifyListeners();
    return temp;
  }

  Future<int> deleteProvider(int id) async {
    final url = '$_url/MateriasPrimas/$id';
    final resp = await http.delete(Uri.parse(url), headers: _headers);
    notifyListeners();
    return json.decode(resp.body);
  }
}
