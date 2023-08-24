import 'package:flutter/material.dart';
import 'package:natura_life/models/proveedor.dart' as providerModel;
// import 'package:natura_life/providers/api_provider.dart';
import 'package:natura_life/services/services.dart';
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

  void _deleteProvider(int index, ProviderService providerService) {
    setState(() {
      providerService
          .deleteProvider(providerService.providers[index].idProveedor!);
    });
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
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      _deleteProvider(index, providerService);
                    },
                    child: GestureDetector(
                      onTap: () {
                        providerService.selectedProvider =
                            providerService.providers[index];
                        Navigator.pushNamed(context, '/Provider');
                      },
                      child: CardProvider(
                          provider: providerService.providers[index]),
                    ),
                  );
                },
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          providerService.selectedProvider = providerModel.Provider(
              idProveedor: int.parse('0'),
              razonSocial: '',
              rfc: '',
              direccion: '',
              correo: '',
              password: '',
              apellido: '',
              nombre: '',
              fechaNacimiento: '2000-01-01',
              telefono: '',
              idStatus: int.parse('1'),
              foto: ' ',
              idUsuario: int.parse('0'));
          Navigator.pushNamed(context, '/Provider');
        },
        backgroundColor: AppTheme.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CardProvider extends StatelessWidget {
  const CardProvider({
    super.key,
    required this.provider,
  });

  final providerModel.Provider provider;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
