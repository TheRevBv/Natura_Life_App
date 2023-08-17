import 'package:flutter/material.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/widget/reusable_widgets.dart';

class Providers extends StatelessWidget {
  const Providers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.generalAppBar(title: 'Proveedores'),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('A'),
                    backgroundColor: AppTheme.fifth,
                    foregroundColor: AppTheme.white,
                  ),
                  title: Text('Titulo del proveedor'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: AppTheme.primary,
                    size: 30,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
