import 'package:flutter/material.dart';
import 'package:natura_life/providers/dashboard_provider.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:provider/provider.dart';

import '../widget/reusable_widgets.dart';
import 'mini_screens/screens.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final screens = [
    const Dashboard(),
    const Products(),
    const Providers(),
    const Orders(),
    const User()
  ];

  @override
  Widget build(BuildContext context) {
    final dbp = Provider.of<DashboardProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: index,
        children: screens,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbp.setMiddleIcon(Icons.house);
          setState(() {
            index = 0;
          });
        },
        backgroundColor: AppTheme.secundary,
        elevation: 2,
        child: Icon(
          dbp.middleIcon,
          color: AppTheme.primary,
          size: 40,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableWidgets.bottomButton(
                  icon: Icons.shopping_cart,
                  action: () {
                    dbp.setMiddleIcon(Icons.shopping_cart);
                    setState(() {
                      index = 1;
                    });
                  }),
              ReusableWidgets.bottomButton(
                  icon: Icons.person_pin,
                  action: () {
                    dbp.setMiddleIcon(Icons.person_pin);
                    setState(() {
                      index = 2;
                    });
                  }),
              const SizedBox(),
              ReusableWidgets.bottomButton(
                  icon: Icons.delivery_dining,
                  action: () {
                    dbp.setMiddleIcon(Icons.delivery_dining);
                    setState(() {
                      index = 3;
                    });
                  }),
              ReusableWidgets.bottomButton(
                  icon: Icons.person,
                  action: () {
                    dbp.setMiddleIcon(Icons.person);
                    setState(() {
                      index = 4;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
