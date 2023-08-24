import 'package:flutter/material.dart';
import 'package:natura_life/providers/api_provider.dart';
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
              image: AssetImage('assets/images/clamaroj/LOGO CLAMAROJ.jpg'),
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
    final ap = Provider.of<APiProvider>(context);
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
              func: () async {
                FocusScope.of(context).unfocus();
                if (lfp.user != '' && lfp.password != '') {
                  lfp.buttonText = 'Cargando';
                  // ignore: unrelated_type_equality_checks
                  if (await ap.login(lfp: lfp) == 'OK') {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/Home');
                  } else {
                    lfp.buttonText = 'Datos incorrectos';
                    await Future.delayed(const Duration(seconds: 3));
                    lfp.buttonText = 'Iniciar Sesión';
                  }
                } else {
                  lfp.buttonText = 'Ni siquiera hay texto';
                  await Future.delayed(const Duration(seconds: 3));
                  lfp.buttonText = 'Iniciar Sesión';
                }
              },
              text: lfp.buttonText),
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
