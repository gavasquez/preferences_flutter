import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  // inicializamos las preferencias se pone de tipo async para que se puede inicializar
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider(modoOscuro: Preferences.modoOscuro))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (_) => HomeScreen(),
        SettingsScreen.routerName: (_) => SettingsScreen()
      },
      // se pone el tema del provider
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
