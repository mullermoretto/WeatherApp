
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/presentation/home/home_controller.dart';
import 'package:weather/presentation/home/home_page.dart';
import 'package:weather/presentation/home/home_repository.dart';

class HomeModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind.singleton((i) => HomeController(repository: i.get())),
    Bind.singleton((i) => HomeRepository()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) {
        return const HomePage();
      },
    )
  ];
}
