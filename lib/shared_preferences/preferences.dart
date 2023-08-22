import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _nombre = '';
  static bool _modoOscuro = false;
  static int _genero = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // se pone en static para que no tenga que instanciar la clase para usar el metodo
  static String get nombre {
    // obtenemos el nombre pero como puede ser null entonces si no existe le asignamos la propiedad _nombre
    return _prefs.getString('nombre') ?? _nombre;
  }
  static set nombre(String nombre) {
    _nombre = nombre;
    _prefs.setString('name', nombre);
  }
  // Modo Oscuro
  static bool get modoOscuro {
    return _prefs.getBool('modo') ?? _modoOscuro;
  }
  static set modoOscuro(bool modo) {
    _modoOscuro = modo;
    _prefs.setBool('modo', modo);
  }
  // Genero
  static int get genero {
    return _prefs.getInt('genero') ?? _genero;
  }
  static set genero(int genero) {
    _genero = genero;
    _prefs.setInt('genero', genero);
  }
}
