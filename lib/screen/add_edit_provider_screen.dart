import 'package:flutter/material.dart';
import 'package:natura_life/widget/reusable_widgets.dart';
import 'package:provider/provider.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/providers/providers_provider.dart';

class AddEditProviderScreen extends StatefulWidget {
  const AddEditProviderScreen({super.key});

  @override
  State<AddEditProviderScreen> createState() => _AddEditProviderScreenState();
}

class _AddEditProviderScreenState extends State<AddEditProviderScreen> {
  final _providerFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    // Provider.of<APiProvider>(context, listen: false).getProviders();
    super.initState();
  }

  void _saveForm() {
    final isValid = _providerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _providerFormKey.currentState!.save();
    // Provider.of<ProvidersProvider>(context, listen: false).addProvider();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          ReusableWidgets.generalAppBar(title: 'Proveedor', hasLeading: true),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _providerFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height *
                      0.2, // Use MediaQuery
                  decoration: BoxDecoration(
                    color: AppTheme.fourth,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: AppTheme.white,
                  ),
                ),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(icon: Icons.person, label: 'ID'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(icon: Icons.person, label: 'Nombre'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                    icon: Icons.person, label: 'Razón Social'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(icon: Icons.person, label: 'RFC'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                    icon: Icons.person, label: 'Contraseña'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(icon: Icons.person, label: 'Correo'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                    icon: Icons.person, label: 'Teléfono'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                    icon: Icons.person, label: 'Dirección'),
                const SizedBox(height: 40),
                ReusableWidgets.filledColorButton(
                  func: () {
                    if (_providerFormKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Guardando proveedor...'),
                        ),
                      );
                    }
                  },
                  text: 'Guardar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
