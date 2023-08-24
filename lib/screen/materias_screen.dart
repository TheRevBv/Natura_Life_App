import 'package:flutter/material.dart';
import 'package:natura_life/providers/providers.dart';
import 'package:natura_life/services/services.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:natura_life/widget/reusable_widgets.dart';
import 'package:provider/provider.dart';

class MateriaPrimaScreen extends StatelessWidget {
  const MateriaPrimaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final materiaSvc = Provider.of<MateriasService>(context);
    final title = materiaSvc.selectedMateria.id == null ||
            materiaSvc.selectedMateria.id == 0
        ? 'Nueva Materia Prima'
        : 'Editar Materia Prima  ${materiaSvc.selectedMateria.id}';
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => MateriaFormProvider(materiaSvc.selectedMateria),
      child: _MateriaScreenBody(
        screenWidth: screenWidth,
        title: title,
        materiaSvc: materiaSvc,
      ),
    );
  }
}

class _MateriaScreenBody extends StatelessWidget {
  const _MateriaScreenBody({
    required this.screenWidth,
    required this.title,
    required this.materiaSvc,
  });

  final double screenWidth;
  final String title;
  final MateriasService materiaSvc;

  @override
  Widget build(BuildContext context) {
    final materiaForm = Provider.of<MateriaFormProvider>(context);

    return Scaffold(
      appBar: ReusableWidgets.generalAppBar(
          title: 'Materia Prima', hasLeading: true),
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
                  radius:
                      screenWidth * 0.1, // Adjust the avatar size responsively
                  child: Text(
                    'MP',
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
              content: const FormMateriaPrima(),
            ),
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!materiaForm.isValidForm()) return;
          materiaSvc.saveOrUpdateMaterias(materiaForm.materiaPrima);
          Navigator.pop(context);
        },
        backgroundColor: AppTheme.primary,
        child: const Icon(Icons.save),
      ),
    );
  }
}

class FormMateriaPrima extends StatelessWidget {
  const FormMateriaPrima({super.key});

  // final MateriaPrima materia;

  @override
  Widget build(BuildContext context) {
    final materiaFormProvider = Provider.of<MateriaFormProvider>(context);
    var materia = materiaFormProvider.materiaPrima;
    return Form(
      key: materiaFormProvider.formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
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
          ReusableWidgets.formInput(
            icon: Icons.qr_code,
            label: 'Codigo',
            initialVal: materia.codigo,
            onchange: (value) => materia.codigo = value,
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.text_fields,
            label: 'Nombre',
            initialVal: materia.nombre,
            onchange: (value) => materia.nombre = value,
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.description,
            label: 'Descripción',
            initialVal: materia.descripcion,
            onchange: (value) => materia.descripcion = value,
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.inventory,
            label: 'Total en Stock',
            initialVal: '${materia.stock}',
            onchange: (value) => materia.stock = int.parse(value),
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.expand_less,
            label: 'Cantidad Mínima',
            initialVal: '${materia.cantMaxima}',
            onchange: (value) => materia.cantMaxima = int.parse(value),
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.expand_more,
            label: 'Cantidad Máxima',
            initialVal: '${materia.cantMinima}',
            onchange: (value) => materia.cantMinima = int.parse(value),
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.attach_money,
            label: 'Precio en MXN',
            initialVal: '${materia.precio}',
            onchange: (value) => materia.precio = double.parse(value),
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'Proveedor',
            initialVal: '${materia.idProveedor}',
            onchange: (value) => materia.idProveedor = int.parse(value),
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'Unidad de Medida',
            initialVal: '${materia.idUnidadMedida}',
            onchange: (value) => materia.idUnidadMedida = int.parse(value),
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'Estatus',
            initialVal: '${materia.idStatus}',
            onchange: (value) => materia.idStatus = int.parse(value),
          ),
          const SizedBox(height: 20),
          ReusableWidgets.formInput(
            icon: Icons.person,
            label: 'Perecedero',
            initialVal: '${materia.perecedero}',
            onchange: (value) => materia.perecedero = int.parse(value),
          ),
          const SizedBox(height: 20),
          // ReusableWidgets.filledColorButton(
          //   func: () => {
          //     print('guardar')
          //     // if (!providerForm.isValidForm()) return;
          //     // providerSvc.saveOrUpdateProvider(providerForm.provider);
          //   },
          //   text: 'Guardar',
          // ),
        ],
      ),
    );
  }
}
