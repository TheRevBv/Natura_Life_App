import 'package:flutter/material.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/widget/reusable_widgets.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.generalAppBar(title: 'Ordenes'),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('Pedido #$index'),
                  trailing: Icon(
                    Icons.face,
                    color: AppTheme.primary,
                    size: 35,
                  ),
                  subtitle: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Para: Cliente'),
                      Text('Estado: Liquido'),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
