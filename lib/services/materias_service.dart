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
  final String _url = Constants.apiUrl;
  final Map<String, String> _headers = Constants.headers;

  MateriasService() {
    getMaterias();
  }

  Future<List<MateriaPrima>> getMaterias() async {
    final url = '$_url/MateriaPrimas';
    final resp = await http.get(Uri.parse(url), headers: _headers);
    final List<dynamic> decodedData = json.decode(resp.body);
    decodedData.forEach((materia) {
      final temp = MateriaPrima.fromMap(materia);
      materias.add(temp);
    });
    notifyListeners();
    print(materias);
    return materias;
  }

  Future<MateriaPrima> getMateriasById(int id) async {
    final url = '$_url/MateriaPrimas/$id';
    final resp = await http.get(Uri.parse(url), headers: _headers);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp = MateriaPrima.fromMap(decodedData);
    notifyListeners();
    return temp;
  }

  Future<MateriaPrima> saveOrUpdateMaterias(MateriaPrima materia) async {
    isSaving = true;
    notifyListeners();
    if (materia.id == null || materia.id == 0) {
      final temp = await createMateriaPrima(materia);
      isSaving = false;
      notifyListeners();
      return temp;
    } else {
      final temp = await updateMateriaPrima(materia);
      isSaving = false;
      notifyListeners();
      return temp;
    }
  }

  Future<MateriaPrima> createMateriaPrima(MateriaPrima materia) async {
    final url = '$_url/MateriaPrimas/';
    final resp = await http.post(Uri.parse(url),
        headers: _headers, body: materia.toJson());
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp = MateriaPrima.fromMap(decodedData);
    materias.add(temp);
    notifyListeners();
    return materia;
  }

  Future<MateriaPrima> updateMateriaPrima(MateriaPrima materia) async {
    final url = '$_url/MateriaPrimas/${materia.id}';
    final resp = await http.put(Uri.parse(url),
        headers: _headers, body: materia.toJson());
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final temp = MateriaPrima.fromMap(decodedData);
    final index = materias.indexWhere((element) => element.id == temp.id);
    materias[index] = temp;
    notifyListeners();
    return temp;
  }

  Future<int> deleteMateriaPrima(int id) async {
    final url = '$_url/MateriaPrimas/$id';
    final resp = await http.delete(Uri.parse(url), headers: _headers);
    notifyListeners();
    if (resp.statusCode == 204) {
      materias.removeWhere((element) => element.id == id);
      notifyListeners();
      return 1;
    } else {
      return 0;
    }
  }
}
