import 'package:flutter/material.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:natura_life/widget/reusable_widgets.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.primary,
            automaticallyImplyLeading: false,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppTheme.tertiary,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                      fit: BoxFit.fitHeight,
                      'assets/images/logo_natural_life.png'),
                ),
              ),
            ),
          ),

          //----------------------------------------------------------------

          SliverList(
            delegate: SliverChildListDelegate(
              [
                Row(
                  children: [
                    ReusableWidgets.divider(),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppTheme.fifth,
                      foregroundColor: Colors.white,
                      child: const Text(
                        'A',
                        style: TextStyle(fontSize: 80),
                      ),
                    ),
                    ReusableWidgets.divider()
                  ],
                ),
                Text(
                  'Juanito Peres',
                  style: WidgetTheme.bigTextTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                ReusableWidgets.dividerWithText(heading: 'Datos de Usuario'),
                const SizedBox(height: 20),
                ReusableWidgets.userData(
                    data: 'correo@correo.com', icon: Icons.email),
                ReusableWidgets.userData(
                    data: 'Nombre Completo', icon: Icons.person_2),
                ReusableWidgets.userData(
                    data: 'Rango', icon: Icons.rocket_launch)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
