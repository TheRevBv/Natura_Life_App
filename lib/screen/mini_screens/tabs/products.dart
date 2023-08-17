import 'package:flutter/material.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';

class ProductTabs {
  static Widget productTab({required List prodList}) {
    return prodList.isEmpty
        ? Center(
            child: Text(
              'Oh, parece que los productos... han desaparecido',
              style: WidgetTheme.appbarTitle,
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: prodList.length,
              itemBuilder: (context, index) {
                var producto = prodList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Product',
                        arguments: prodList[index]);
                  },
                  child: Card(
                    child: ListTile(
                      leading: FadeInImage(
                        placeholder: const AssetImage(
                            'assets/images/logo_natural_life.png'),
                        image: NetworkImage(producto['imagen']),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(producto['nombre']),
                          Text('\$${producto['costo_venta']}')
                        ],
                      ),
                      subtitle: Text(producto['descripcion']),
                      trailing: CircleAvatar(
                        backgroundColor: AppTheme.fourth,
                        foregroundColor: Colors.white,
                        child: Text(producto['existencias']),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }

//------------------------------------------------------------------------------

  static Widget materialTab({required List matList}) {
    return matList.isEmpty
        ? Center(
            child: Text(
              'No hay nada para mostrar',
              style: WidgetTheme.appbarTitle,
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: matList.length,
              itemBuilder: (context, index) {
                var item = matList[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(item['nombre']),
                      trailing: Text(
                        '${item['cantidad']} ${item['unidadMedida']}',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.fifth),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
