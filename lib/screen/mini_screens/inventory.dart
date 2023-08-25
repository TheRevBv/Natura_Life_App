import 'package:flutter/material.dart';
import 'package:natura_life/screen/mini_screens/tabs/screens.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';

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
              labelStyle: WidgetTheme.tabTitle,
              indicatorColor: AppTheme.fifth,
              indicatorWeight: 3.5,
              tabs: const [Tab(text: 'Productos'), Tab(text: 'Materiales')]),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            ProductosTab(),
            MateriasTab(),
          ],
        ),
      ),
    );
  }

  Widget _bottomButtons() {
    return _tabController.index == 0
        ? const FloatingActionButton(
            shape: StadiumBorder(),
            onPressed: null,
            backgroundColor: Colors.redAccent,
            child: Icon(
              Icons.message,
              size: 20.0,
            ))
        : const FloatingActionButton(
            shape: StadiumBorder(),
            onPressed: null,
            backgroundColor: Colors.redAccent,
            child: Icon(
              Icons.edit,
              size: 20.0,
            ),
          );
  }
}
