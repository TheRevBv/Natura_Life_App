import 'package:flutter/material.dart';
import 'package:natura_life/widget/reusable_widgets.dart';

import '../theme/apptheme.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.fourth,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                child: Text(
                  'Producto $id',
                  style: TextStyle(
                      fontFamily: 'OleoScript',
                      fontSize: 27,
                      color: AppTheme.dark),
                ),
              ),
              background: const FadeInImage(
                placeholder: AssetImage('assets/images/logo_natural_life.png'),
                fit: BoxFit.cover,
                image: AssetImage('assets/images/fondo_1.png'),
              ),
            ),
          ),
          //------------------------------------------------------------------------------------------------
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      ReusableWidgets.dividerWithText(heading: 'Descripcion'),
                      const SizedBox(height: 10),
                      Text(
                          'Esse voluptate ipsum culpa pariatur qui nisi. Aliqua non aliquip irure eiusmod aliqua dolor. Sint ea aliqua sint elit esse dolor id anim ex. Sit mollit tempor duis adipisicing do tempor cillum fugiat dolor culpa officia nulla magna in. Incididunt pariatur officia ipsum mollit velit non Lorem nulla duis ea deserunt occaecat.'),
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
