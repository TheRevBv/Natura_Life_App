import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:natura_life/providers/providers.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:provider/provider.dart';

class ProductosTab extends StatelessWidget {
  const ProductosTab({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final prodProvider = Provider.of<APiProvider>(context);
    final prodList = prodProvider.products;
    return prodList.isEmpty
        ? const Center(child: Text('No hay productos'))
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: prodList.length,
              itemBuilder: (context, index) {
                var producto = prodList[index];
                var image = producto['foto'] != null &&
                        producto['foto'].contains('data:image')
                    ? base64Decode(producto['foto'].substring(23))
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
                          child: Text(
                            '${producto['precio']}',
                            style: const TextStyle(fontSize: 12),
                          )),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
