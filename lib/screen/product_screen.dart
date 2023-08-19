import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:natura_life/providers/api_provider.dart';
import 'package:natura_life/providers/dashboard_provider.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:natura_life/widget/reusable_widgets.dart';
import 'package:provider/provider.dart';

import '../theme/apptheme.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<APiProvider>(context);
    final dbp = Provider.of<DashboardProvider>(context);
    final Map producto = ModalRoute.of(context)!.settings.arguments as Map;
    var imagen =
        const Base64Decoder().convert(producto['imagen'].substring(22));
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.fourth,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
              ),
              background: Image.memory(imagen),
            ),
          ),
          //------------------------------------------------------------------------------------------------
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ReusableWidgets.cardContainer(
                    content: Column(
                      children: [
                        Text(
                          producto['nombreProducto'],
                          style: TextStyle(
                              fontFamily: 'OleoScript',
                              fontSize: 27,
                              color: AppTheme.dark),
                        ),
                        const SizedBox(height: 20),
                        ReusableWidgets.dividerWithText(heading: 'Descripcion'),
                        const SizedBox(height: 10),
                        Text(producto['descripcion']),
                        const SizedBox(height: 20),
                        ReusableWidgets.userData(
                            data: 'Existencias: ${producto['cantidad']}',
                            icon: Icons.numbers),
                        ReusableWidgets.userData(
                            data: 'Precio público: \$${producto['costo']}',
                            icon: Icons.price_change),
                        const SizedBox(height: 30),
                        ReusableWidgets.filledColorButton(
                            func: () => showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text('¿Estás seguro?',
                                          style: WidgetTheme.appbarTitle),
                                      content: Text(
                                          'Eliminar ${producto['nombreProducto']} lo borrará para siempre (mucho tiempo)'),
                                      actions: <Widget>[
                                        ReusableWidgets.borderColorButton(
                                            func: () async {
                                              if (await ap.deleteProduct(
                                                      producto['id']) ==
                                                  'OK') {
                                                // ignore: use_build_context_synchronously
                                                Navigator.pop(context);
                                                // ignore: use_build_context_synchronously
                                                Navigator.pushNamed(
                                                    context, '/Home');
                                              } else {
                                                // ignore: use_build_context_synchronously
                                                Navigator.pop(context, 'Ok');
                                              }
                                            },
                                            text: 'Aceptar',
                                            textColor: AppTheme.white,
                                            bgColor: Colors.redAccent),
                                        ReusableWidgets.borderColorButton(
                                            func: () => Navigator.pop(
                                                context, 'Cancel'),
                                            text: 'Cancelar',
                                            textColor: AppTheme.primary,
                                            bgColor: AppTheme.white),
                                      ],
                                    )),
                            text: dbp.deleteButtonText)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
