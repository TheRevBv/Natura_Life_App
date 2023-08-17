import 'package:flutter/material.dart';
import 'package:natura_life/widget/reusable_widgets.dart';

import '../theme/apptheme.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map producto = ModalRoute.of(context)!.settings.arguments as Map;
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
                child: Text(
                  producto['nombre'],
                  style: TextStyle(
                      fontFamily: 'OleoScript',
                      fontSize: 27,
                      color: AppTheme.dark),
                ),
              ),
              background: FadeInImage(
                placeholder:
                    const AssetImage('assets/images/logo_natural_life.png'),
                fit: BoxFit.cover,
                image: NetworkImage(producto['imagen']),
              ),
            ),
          ),
          //------------------------------------------------------------------------------------------------
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      ReusableWidgets.dividerWithText(heading: 'Descripcion'),
                      const SizedBox(height: 10),
                      Text(producto['descripcion']),
                      const SizedBox(height: 20),
                      ReusableWidgets.userData(
                          data: 'Existencias: ${producto['existencias']}',
                          icon: Icons.numbers),
                      ReusableWidgets.userData(
                          data: 'Precio público: \$${producto['costo_venta']}',
                          icon: Icons.price_change)
                    ],
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
