import 'package:flutter/material.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('INICIO'),
        ),
        // CREAR MENU LATERAL
        drawer: SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Modo Oscuro: ${Preferences.modoOscuro}'),
            const Divider(),
            Text('Genero: ${Preferences.genero}'),
            const Divider(),
            Text('Nombre de Usuario: ${Preferences.nombre}'),
            const Divider()
          ],
        ));
  }
}
