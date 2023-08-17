import 'package:flutter/material.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:natura_life/widget/reusable_widgets.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map provider = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar:
          ReusableWidgets.generalAppBar(title: 'Proveedor', hasLeading: true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.fourth,
                  foregroundColor: AppTheme.white,
                  radius: 50,
                  child: Text(
                    provider['nombre'].substring(0, 1),
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider['nombre'],
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
            ReusableWidgets.cardContainer(
              content: Column(
                children: [
                  ReusableWidgets.userData(
                      data: provider['nombre'], icon: Icons.person_2),
                  ReusableWidgets.userData(
                      data: provider['corrreo'], icon: Icons.email_rounded),
                  ReusableWidgets.userData(
                      data: provider['telefono'],
                      icon: Icons.phone_android_rounded),
                  ReusableWidgets.userData(
                      data: provider['direccion'], icon: Icons.map),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
