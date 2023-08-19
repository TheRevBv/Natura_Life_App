import 'dart:convert';

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
                var image = const Base64Decoder()
                    .convert(producto['imagen'].substring(22));
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Product',
                        arguments: prodList[index]);
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.memory(image),
                      title: Text(producto['nombreProducto']),
                      subtitle: Column(
                        children: [
                          Text(producto['descripcion']),
                          Text('\$${producto['costo']}')
                        ],
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: AppTheme.fourth,
                        foregroundColor: Colors.white,
                        child: Text('${producto['cantidad']}'),
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
