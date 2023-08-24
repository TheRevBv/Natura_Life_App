import 'package:flutter/material.dart';
// import 'package:natura_life/providers/api_provider.dart';
import 'package:natura_life/services/providers_service.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:natura_life/widget/reusable_widgets.dart';
import 'package:provider/provider.dart';

class Providers extends StatefulWidget {
  const Providers({super.key});

  @override
  State<Providers> createState() => _ProvidersState();
}

class _ProvidersState extends State<Providers> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final prodProvider = Provider.of<APiProvider>(context);
    final providerService = Provider.of<ProviderService>(context);

    return Scaffold(
      appBar: ReusableWidgets.generalAppBar(title: 'Proveedores'),
      body: providerService.providers.isEmpty
          ? Center(
              child: Text(
                'Los proveedores se han ido de sabatico... pronto vuelven',
                style: WidgetTheme.appbarTitle,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: providerService.providers.length,
                itemBuilder: (context, index) {
                  var provider = providerService.providers[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/Provider',
                          arguments: provider);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppTheme.fifth,
                            foregroundColor: AppTheme.white,
                            child: Text(provider.razonSocial[0].toUpperCase()),
                          ),
                          title: Text(provider.razonSocial),
                          trailing: Icon(
                            Icons.chevron_right,
                            color: AppTheme.primary,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
      // floatingActionButton: ReusableWidgets.floatingActionButton(
      //   action: () {
      //     Navigator.pushNamed(context, '/AddEditProvider');
      //   },
      //   icon: Icons.add,)
    );
  }
}
