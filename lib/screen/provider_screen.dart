import 'package:flutter/material.dart';
// import 'package:natura_life/models/proveedor.dart' as providerModel;
import 'package:natura_life/providers/providers.dart';
import 'package:natura_life/services/services.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:natura_life/widget/reusable_widgets.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerSvc = Provider.of<ProviderService>(context);
    final title = providerSvc.selectedProvider.idProveedor == null
        ? 'Nuevo Proveedor'
        : 'Editar Proveedor ${providerSvc.selectedProvider.idProveedor}';
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => ProviderFormProvider(providerSvc.selectedProvider),
      child: _ProviderScreenBody(
        screenWidth: screenWidth,
        title: title,
        providerSvc: providerSvc,
      ),
    );
  }
}

class _ProviderScreenBody extends StatelessWidget {
  const _ProviderScreenBody({
    super.key,
    required this.screenWidth,
    required this.title,
    required this.providerSvc,
  });

  final double screenWidth;
  final String title;
  final ProviderService providerSvc;

  @override
  Widget build(BuildContext context) {
    final providerForm = Provider.of<ProviderFormProvider>(context);

    return Scaffold(
        appBar:
            ReusableWidgets.generalAppBar(title: 'Proveedor', hasLeading: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppTheme.fourth,
                      foregroundColor: AppTheme.white,
                      radius: screenWidth *
                          0.1, // Adjust the avatar size responsively
                      child: Text(
                        'P',
                        style: TextStyle(fontSize: screenWidth * 0.1),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: WidgetTheme.mediumTex,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.red,
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableWidgets.cardContainer(
                  content: const FormProvider(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (!providerForm.isValidForm()) return;
            providerSvc.saveOrUpdateProvider(providerForm.provider);
            Navigator.pop(context);
          },
          backgroundColor: AppTheme.primary,
          child: const Icon(Icons.save),
        ));
  }
}

class FormProvider extends StatelessWidget {
  const FormProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerFormProvider = Provider.of<ProviderFormProvider>(context);
    var proveedor = providerFormProvider.provider;
    return Form(
      key: providerFormProvider.formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          // ReusableWidgets.formInput(
          //   icon: Icons.person,
          //   label: 'ID Proveedor',
          // ),
          // SizedBox(height: 20),
          // ReusableWidgets.formInput(
          //   icon: Icons.person,
          //   label: 'ID Usuario',
          // ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'Razon Social',
            initialVal: proveedor.razonSocial,
            onchange: (value) => proveedor.razonSocial = value,
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'Nombre Contacto',
            initialVal: proveedor.nombre,
            onchange: (value) => proveedor.nombre = value,
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'Apellido',
            initialVal: proveedor.apellido,
            onchange: (value) => proveedor.apellido = value,
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'RFC',
            initialVal: proveedor.rfc,
            onchange: (value) => proveedor.rfc = value,
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'Direccion',
            initialVal: proveedor.direccion,
            onchange: (value) => proveedor.direccion = value,
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'Telefono',
            initialVal: proveedor.telefono,
            onchange: (value) => proveedor.telefono = value,
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'Email',
            initialVal: proveedor.correo,
            onchange: (value) => proveedor.correo = value,
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'Password',
            onchange: (value) => proveedor.password = value,
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'Estatus',
            initialVal: proveedor.idStatus.toString(),
            onchange: (value) => proveedor.idStatus = int.parse(value),
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInputDate(
            icon: Icons.person,
            label: 'Fecha de Nacimiento',
            initialVal: proveedor.fechaNacimiento,
            onchange: (value) => proveedor.fechaNacimiento = value,
          ),
        ],
      ),
    );
  }
}
