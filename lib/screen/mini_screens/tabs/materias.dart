import 'package:flutter/material.dart';
import 'package:natura_life/models/materia_prima.dart';
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
    return materiasSvc.materias.isEmpty
        ? const Center(child: Text('No hay materias'))
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: materiasSvc.materias.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    materiasSvc.selectedMateria = materiasSvc.materias[index];
                    Navigator.pushNamed(context, '/MateriaPrima');
                  },
                  child: CardMateria(materia: materiasSvc.materias[index]),
                );
              },
            ),
          );
  }
}

class CardMateria extends StatelessWidget {
  const CardMateria({
    super.key,
    required this.materia,
  });

  final MateriaPrima materia;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.fifth,
          foregroundColor: AppTheme.white,
          child: Text(materia.nombre[0].toUpperCase()),
        ),
        title: Text(materia.nombre.toUpperCase()),
        subtitle: Column(
          children: [Text(materia.descripcion), Text('\$${materia.precio}')],
        ),
        trailing: CircleAvatar(
          backgroundColor: AppTheme.fourth,
          foregroundColor: Colors.white,
          child: Text('${materia.stock}'),
        ),
      ),
    );
  }
}
