import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/presentation/home/home_module.dart';
import 'package:weather/utils/routes.dart';

class AppModule extends Module {
  
  @override
  List<Bind<Object>> get binds =>[ ];
  
  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Routes.home, module: HomeModule(),)
  ];
  
}