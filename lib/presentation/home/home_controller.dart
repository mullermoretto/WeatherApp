
import 'package:mobx/mobx.dart';
import 'package:weather/presentation/home/home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final HomeRepository repository;

  _HomeController({required this.repository});

}
