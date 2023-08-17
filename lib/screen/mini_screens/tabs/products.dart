import 'package:flutter/material.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';

class ProductTabs {
  static Padding productTab() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/Product', arguments: index);
            },
            child: Card(
              child: ListTile(
                leading: FadeInImage(
                  placeholder:
                      const AssetImage('assets/images/logo_natural_life.png'),
                  image: NetworkImage(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${index + 1}.png'),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Titulo #$index'), const Text('\$0.00')],
                ),
                subtitle: const Text('Subtitulo del producto'),
                trailing: CircleAvatar(
                  backgroundColor: AppTheme.fourth,
                  foregroundColor: Colors.white,
                  child: const Text('150'),
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
              itemCount: 20,
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
