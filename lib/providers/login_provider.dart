import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String user = '';
  String password = '';
  String _buttonText = 'Iniciar Sesión';
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String get buttonText => _buttonText;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set buttonText(String value) {
    _buttonText = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
