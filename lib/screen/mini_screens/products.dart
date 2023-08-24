import 'package:flutter/material.dart';
// import 'package:natura_life/models/materia_prima.dart';
import 'package:natura_life/providers/providers.dart';
import 'package:natura_life/screen/mini_screens/tabs/products.dart';
import 'package:natura_life/services/materias_service.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    Provider.of<APiProvider>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prodProvider = Provider.of<APiProvider>(context);
    final materiaSvc = Provider.of<MateriasService>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Inventario',
            style: WidgetTheme.appbarTitle,
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(
              labelStyle: WidgetTheme.tabTitle,
              indicatorColor: AppTheme.fifth,
              indicatorWeight: 3.5,
              tabs: const [Tab(text: 'Productos'), Tab(text: 'Materiales')]),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProductTabs.productTab(prodList: prodProvider.products),
            ProductTabs.materialTab(
                matList: materiaSvc.materias, contexto: context),
          ],
        ),
      ),
    );
  }
}
