import 'package:flutter/material.dart';
import 'package:natura_life/providers/login_provider.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:natura_life/widget/reusable_widgets.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fondo_1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 300,
            ),
            child: Center(
              child: ReusableWidgets.cardContainer(
                content: const LoginForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final lfp = Provider.of<LoginFormProvider>(context);
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Iniciar sesion',
            style: WidgetTheme.loginTitle,
          ),
          const SizedBox(height: 40),
          ReusableWidgets.loginInput(
            icon: Icons.email,
            label: 'email',
            onchange: (value) => lfp.user = value,
          ),
          const SizedBox(height: 40),
          ReusableWidgets.loginInput(
            icon: Icons.password,
            label: 'password',
            obscure: true,
            onchange: (value) => lfp.password = value,
          ),
          const SizedBox(height: 50),
          ReusableWidgets.filledColorButton(
              func: () {
                Navigator.pushNamed(context, '/Home');
              },
              text: 'Iniciar Sesión'),
        ],
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
            'assets/images/logo_natural_life.png', // Ruta de tu imagen (debe estar en la carpeta 'assets')
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
