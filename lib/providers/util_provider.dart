import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UtilProvider extends ChangeNotifier {
  static final UtilProvider rtp = UtilProvider._();
  UtilProvider._();

  Future responseHTTP({required String urlBase}) async {
    var response = await http.get(Uri.parse(urlBase), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFsZXhhbmRlcjE5QGdtYWlsLmNvbSIsInJvbGUiOiJBZG1pbmlzdHJhZG9yIiwibmJmIjoxNjkyMTQ1ODE2LCJleHAiOjE2OTIxNDk0MTYsImlhdCI6MTY5MjE0NTgxNn0.9MTLJuAnfsalI2zC2pbG-LShovLULc1wJ6KkVnUUVS0',
    });
    return response;
  }
  //contrasenia
}
