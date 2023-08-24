import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:natura_life/models/materia_prima.dart';
import 'package:natura_life/services/services.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:provider/provider.dart';

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
  static Widget materialTab({
    required List<MateriaPrima> matList,
    required BuildContext contexto,
    // required MateriasService materiasSvc
  }) {
    final materiasSvc = Provider.of<MateriasService>(contexto);
    void deleteMateria(int index, MateriasService materiasSvc) {
      materiasSvc.deleteMateriaPrima(materiasSvc.materias[index].id!);
    }

    return matList.isEmpty
        ? Center(
            child: Text(
              'No hay nada para mostrar',
              style: WidgetTheme.appbarTitle,
            ),
          )
        : Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: matList.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          color: Colors.red,
                          child: const Icon(Icons.delete),
                        ),
                        onDismissed: (direction) {
                          deleteMateria(index, materiasSvc);
                        },
                        child: GestureDetector(
                          onTap: () {
                            // print(matList[index]);
                            materiasSvc.selectedMateria = matList[index];
                            Navigator.pushNamed(context, '/MateriaPrima');
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  matList[index].nombre.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.fifth,
                                  ),
                                ),
                                trailing: Text(
                                  '\$${matList[index].precio}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.fifth,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                // child: Container(),
                child: FloatingActionButton(
                  onPressed: () {
                    materiasSvc.selectedMateria = MateriaPrima(
                      id: 0,
                      codigo: '',
                      nombre: '',
                      descripcion: '',
                      perecedero: 0,
                      stock: 0,
                      cantMinima: 0,
                      cantMaxima: 0,
                      idUnidadMedida: 0,
                      precio: 0,
                      foto: ' ',
                      idProveedor: 0,
                      idStatus: 1,
                    );
                    Navigator.pushNamed(contexto, '/MateriaPrima');
                  },
                  backgroundColor: AppTheme.primary,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          );
  }
}
