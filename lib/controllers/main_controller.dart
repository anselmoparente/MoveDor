import 'package:mobx/mobx.dart';

// Include generated file
part 'main_controller.g.dart';

// This is the class used by rest of your codebase
class MainController = _MainController with _$MainController;

// The store-class
abstract class _MainController with Store {
  @observable
  bool medication = true;
  @action
  void changedMedication(bool value) => medication = value;

  @observable
  bool feelPain;
  @action
  void changeFeelPain(bool value) => feelPain = value;

  @observable
  bool painSup = false;
  @action
  void changePainSup(bool value) => painSup = value;

  @observable
  bool painInf = false;
  @action
  void changePainInf(bool value) => painInf = value;

  @observable
  String timeDor;
  @action
  void changeTimeDor(String value) => timeDor = value;

  @observable
  String nameMedications;
}