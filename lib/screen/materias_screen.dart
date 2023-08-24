import 'package:flutter/material.dart';
import 'package:natura_life/models/materia_prima.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:natura_life/widget/reusable_widgets.dart';

class MateriaPrimaScreen extends StatelessWidget {
  const MateriaPrimaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final materiaPrima =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    MateriaPrima materia = MateriaPrima.fromMap(materiaPrima);
    final _providerFormKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: ReusableWidgets.generalAppBar(
        title: 'Materia Prima',
        hasLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _providerFormKey,
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
                  onchange: (value) => value.codigo = value,
                ),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                  icon: Icons.text_fields,
                  label: 'Nombre',
                  initialVal: materia.nombre,
                  onchange: (value) => value.codigo = value,
                ),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                  icon: Icons.description,
                  label: 'Descripción',
                  initialVal: materia.descripcion,
                  onchange: (value) => value.codigo = value,
                ),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                  icon: Icons.inventory,
                  label: 'Total en Stock',
                  initialVal: '${materia.stock}',
                  onchange: (value) => value.codigo = value,
                ),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                  icon: Icons.expand_less,
                  label: 'Cantidad Mínima',
                  initialVal: '${materia.cantMaxima}',
                  onchange: (value) => value.codigo = value,
                ),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                  icon: Icons.expand_more,
                  label: 'Cantidad Máxima',
                  initialVal: '${materia.cantMinima}',
                  onchange: (value) => value.codigo = value,
                ),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                  icon: Icons.attach_money,
                  label: 'Precio en MXN',
                  initialVal: '${materia.precio}',
                  onchange: (value) => value.codigo = value,
                ),
                const SizedBox(height: 20),
                ReusableWidgets.filledColorButton(
                  func: () => {
                    print('guardar')
                    // if (!providerForm.isValidForm()) return;
                    // providerSvc.saveOrUpdateProvider(providerForm.provider);
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
