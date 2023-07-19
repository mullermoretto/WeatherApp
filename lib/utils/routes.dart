import 'package:flutter_modular/flutter_modular.dart';

abstract class Routes {
  static String home = "/home/";

  static void goToHomePage() {
    //print('Calling Home Page. ');
    Modular.to.pushNamed(
      Routes.home,
    );
  }
}