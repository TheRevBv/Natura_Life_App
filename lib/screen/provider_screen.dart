import 'package:flutter/material.dart';
import 'package:natura_life/models/proveedor.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:natura_life/widget/reusable_widgets.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = ModalRoute.of(context)!.settings.arguments as Provider;

    return Scaffold(
      appBar:
          ReusableWidgets.generalAppBar(title: 'Proveedor', hasLeading: true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.fourth,
                  foregroundColor: AppTheme.white,
                  radius: 50,
                  child: Text(
                    provider.razonSocial[0].toUpperCase(),
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.razonSocial,
                        style: WidgetTheme.mediumTex,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Divider(
                color: Colors.red,
              ),
            ),
            Expanded(
              child: ReusableWidgets.cardContainer(
                content: Column(
                  children: [
                    ReusableWidgets.userData(
                        data: provider.nombre, icon: Icons.person),
                    ReusableWidgets.userData(
                        data: provider.correo, icon: Icons.email),
                    ReusableWidgets.userData(
                        data: provider.telefono, icon: Icons.phone),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
