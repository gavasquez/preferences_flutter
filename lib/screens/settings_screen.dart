import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'Settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /* bool modoOscuro = false;
  int genero = 1;
  String nombre = 'Pedro'; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AJUSTES'),
        ),
        drawer: SideMenu(),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const Text(
                  'Ajustes',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                    title: const Text('Modo Oscuro'),
                    value: Preferences.modoOscuro,
                    onChanged: (value) {
                      Preferences.modoOscuro = value;
                      // se instl
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      // si el value es true se pone en ModoDark si no se pone en ModoLight
                      value
                          ? themeProvider.setDarkModo()
                          : themeProvider.setLightMode();
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    title: const Text('Masculino'),
                    value: 1,
                    groupValue: Preferences.genero,
                    onChanged: (value) {
                      Preferences.genero = value ?? 1;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    title: const Text('Femenino'),
                    value: 2,
                    groupValue: Preferences.genero,
                    onChanged: (value) {
                      Preferences.genero = value ?? 2;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.nombre,
                    onChanged: (value) {
                      Preferences.nombre = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        labelText: 'Nombre', helperText: 'Nombre del Usuario'),
                  ),
                )
              ])),
        ));
  }
}
