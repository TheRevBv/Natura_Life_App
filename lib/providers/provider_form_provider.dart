import 'package:flutter/material.dart';
import 'package:natura_life/models/proveedor.dart';

class ProviderFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Provider provider;

  ProviderFormProvider(this.provider);

  bool isValidForm() {
    print(provider.toJson());
    return formkey.currentState?.validate() ?? false;
  }
}
