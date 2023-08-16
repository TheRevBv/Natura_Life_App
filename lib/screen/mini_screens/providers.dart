import 'package:flutter/material.dart';
import 'package:natura_life/widget/reusable_widgets.dart';

class Providers extends StatelessWidget {
  const Providers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.generalAppBar(title: 'Proveedores'),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/fondo_1.png',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
