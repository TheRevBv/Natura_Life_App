import 'package:flutter/material.dart';
import 'package:natura_life/models/materia_prima.dart';
import 'package:natura_life/screen/mini_screens/tabs/screens.dart';
import 'package:natura_life/services/services.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
    // Provider.of<APiProvider>(context, listen: false).getProducts();
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        floatingActionButton: _bottomButtons(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Inventario',
            style: WidgetTheme.appbarTitle,
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(
              controller: _tabController,
              labelStyle: WidgetTheme.tabTitle,
              indicatorColor: AppTheme.fifth,
              indicatorWeight: 3.5,
              tabs: const [Tab(text: 'Productos'), Tab(text: 'Materiales')]),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: const BouncingScrollPhysics(),
          children: const [
            ProductosTab(),
            MateriasTab(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton? _bottomButtons() {
    final materiasSvc = Provider.of<MateriasService>(context);
    return _tabController.index == 0
        ? null
        // const FloatingActionButton(
        //     heroTag: 'goToProductForm',
        //     shape: StadiumBorder(),
        //     onPressed: null,
        //     backgroundColor: Colors.redAccent,
        //     child: Icon(
        //       Icons.message,
        //       size: 20.0,
        //     ))
        : FloatingActionButton(
            onPressed: () {
              materiasSvc.selectedMateria = MateriaPrima(
                id: 0,
                codigo: '',
                nombre: '',
                descripcion: '',
                precio: 0,
                stock: 0,
                cantMaxima: 0,
                cantMinima: 0,
                foto: '',
                idUnidadMedida: 0,
                idStatus: 1,
                perecedero: 12,
                idProveedor: 0,
              );
              Navigator.pushNamed(context, '/MateriaPrima');
            },
            heroTag: 'goToMateriaForm',
            shape: const StadiumBorder(),
            backgroundColor: AppTheme.primary,
            child: const Icon(
              Icons.add,
              size: 20.0,
            ),
          );
  }
}
