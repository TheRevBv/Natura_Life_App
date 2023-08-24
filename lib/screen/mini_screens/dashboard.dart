import 'package:flutter/material.dart';
import 'package:natura_life/theme/widget_styles.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/clamaroj/LOGO CLAMAROJ.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 300,
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Bienvenido al Dashboard',
                    style: WidgetTheme.loginTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 90),
                  Text(
                    'Siente libre de pasearte por aqui :)',
                    style: WidgetTheme.appbarTitle,
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TransparentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo de la AppBar (puedes cambiar esto por una imagen si lo deseas)
        Container(
          height: 300.0,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
        ),
        // Imagen en el centro de la AppBar
        Center(
          child: Image.asset(
            'assets/images/clamaroj/logo inicio.png',
            width: 250.0,
            height: 250.0,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(300); // Tamaño preferido de la AppBar
}
