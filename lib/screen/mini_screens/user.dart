import 'package:flutter/material.dart';
import 'package:natura_life/providers/dashboard_provider.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:natura_life/widget/reusable_widgets.dart';
import 'package:provider/provider.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  void initState() {
    Provider.of<DashboardProvider>(context, listen: false).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<DashboardProvider>(context);
    var userData = data.userData;
    return Scaffold(
      body: userData.isEmpty
          ? Center(
              child: Text(
                'No hay usuario?',
                style: WidgetTheme.appbarTitle,
              ),
            )
          : CustomScrollView(
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ReusableWidgets.divider(),
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: AppTheme.fifth,
                                  foregroundColor: Colors.white,
                                  child: Text(
                                    userData['nombre'].substring(0, 1),
                                    style: const TextStyle(fontSize: 80),
                                  ),
                                ),
                                ReusableWidgets.divider()
                              ],
                            ),
                            Text(
                              '${userData['nombre']}',
                              style: WidgetTheme.bigTextTitle,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            ReusableWidgets.cardContainer(
                                content: Column(
                              children: [
                                ReusableWidgets.dividerWithText(
                                    heading: 'Datos de Usuario'),
                                const SizedBox(height: 20),
                                ReusableWidgets.userData(
                                    data: userData['correo'],
                                    icon: Icons.email),
                                ReusableWidgets.userData(
                                    data:
                                        '${userData['nombre']} ${userData['apellidos']}',
                                    icon: Icons.person_2),
                                ReusableWidgets.userData(
                                    data: userData['rol'],
                                    icon: Icons.rocket_launch),
                                ReusableWidgets.userData(
                                    data: userData['direccion'],
                                    icon: Icons.map_rounded),
                                ReusableWidgets.userData(
                                    data: userData['telefono'],
                                    icon: Icons.phone_android_rounded),
                                const SizedBox(height: 20),
                                ReusableWidgets.filledColorButton(
                                    func: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(context, '/Login');
                                    },
                                    text: 'Cerrar Sesión'),
                                const SizedBox(height: 20),
                              ],
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
