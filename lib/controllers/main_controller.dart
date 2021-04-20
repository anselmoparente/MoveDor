import 'package:mobx/mobx.dart';

// Include generated file
part 'main_controller.g.dart';

// This is the class used by rest of your codebase
class MainController = _MainController with _$MainController;

// The store-class
abstract class _MainController with Store {
  @observable
  bool medication = true;

  @observable
  String nameMedications;

  @action
  void changedMedication(bool value) => medication = value;
}
