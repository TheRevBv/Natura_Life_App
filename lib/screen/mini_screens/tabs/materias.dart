import 'package:flutter/material.dart';
import 'package:natura_life/services/services.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:provider/provider.dart';

class MateriasTab extends StatelessWidget {
  const MateriasTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final materiasSvc = Provider.of<MateriasService>(context);
    final materias = materiasSvc.materias;
    return materias.isEmpty
        ? const Center(child: Text('No hay materias'))
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: materias.length,
              itemBuilder: (context, index) {
                var materia = materias[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Materia',
                        arguments: materias[index]);
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.fifth,
                        foregroundColor: AppTheme.white,
                        child: Text(materia.nombre[0].toUpperCase()),
                      ),
                      title: Text(materia.nombre),
                      subtitle: Column(
                        children: [
                          Text(materia.descripcion),
                          Text('\$${materia.precio}')
                        ],
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: AppTheme.fourth,
                        foregroundColor: Colors.white,
                        child: Text('${materia.precio}'),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
