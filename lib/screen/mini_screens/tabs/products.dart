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
                var image = producto['foto'] == null
                    ? base64Decode(producto['foto'])
                    : null;
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Product',
                        arguments: prodList[index]);
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.fifth,
                        foregroundColor: AppTheme.white,
                        child: image == null
                            ? Text(producto['nombre'][0].toUpperCase())
                            : Image.memory(image),
                      ),
                      title: Text(producto['nombre']),
                      subtitle: Column(
                        children: [
                          Text(producto['descripcion']),
                          Text('\$${producto['precio']}')
                        ],
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: AppTheme.fourth,
                        foregroundColor: Colors.white,
                        child: Text('${producto['precio']}'),
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
