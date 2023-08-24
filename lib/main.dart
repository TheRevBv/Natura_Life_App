import 'package:flutter/material.dart';
import 'package:natura_life/providers/providers.dart';
import 'package:natura_life/routes/approutes.dart';
import 'package:natura_life/services/services.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => APiProvider()),
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => ProviderService(), lazy: true),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Natura Life',
          theme: AppTheme.lightTheme,
          initialRoute: AppRoutes.initialROute,
          routes: AppRoutes.routes,
          onUnknownRoute: (settings) => AppRoutes.onUknownRoute(settings)),
    );
  }
}
