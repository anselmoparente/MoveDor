import 'package:mobx/mobx.dart';

// Include generated file
part 'search_controller.g.dart';

// This is the class used by rest of your codebase
class SearchController = _SearchController with _$SearchController;

// The store-class
abstract class _SearchController with Store {
  @observable
  bool medication;
  @action
  void changedMedication(bool value) => medication = value;

  @observable
  String timeMedication;
  @action
  void changedTimeMedication(String value) => timeMedication = value;

  @observable
  String nameMedications;

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
  int painScale = 0;
  @action
  void changePainScale(double value) => painScale = value.toInt();

  @observable
  String timeDor;
  @action
  void changeTimeDor(String value) => timeDor = value;

  ObservableList<String> selectedSports = ObservableList<String>();

  ObservableList<String> selectedSintoms = ObservableList<String>();

  @observable
  double question1 = 0;
  @action
  changeQuestion1(double value) => question1 = value;
  @observable
  String textQuestion1;
  @action
  void changeTextQ1(String value) => textQuestion1 = value;

  @observable
  double question2 = 0;
  @action
  changeQuestion2(double value) => question2 = value;
  @observable
  String textQuestion2 = "Incerto";
  @action
  void changeTextQ2(String value) => textQuestion2 = value;

  @observable
  double question3 = 0;
  @action
  changeQuestion3(double value) => question3 = value;
  @observable
  String textQuestion3 = "Incerto";
  @action
  void changeTextQ3(String value) => textQuestion3 = value;

  @observable
  double question4 = 0;
  @action
  changeQuestion4(double value) => question4 = value;
  @observable
  String textQuestion4 = "Incerto";
  @action
  void changeTextQ4(String value) => textQuestion4 = value;

  @observable
  double question5 = 0;
  @action
  changeQuestion5(double value) => question5 = value;
  @observable
  String textQuestion5 = "Incerto";
  @action
  void changeTextQ5(String value) => textQuestion5 = value;

  @observable
  double question6 = 0;
  @action
  changeQuestion6(double value) => question6 = value;
  @observable
  String textQuestion6 = "Incerto";
  @action
  void changeTextQ6(String value) => textQuestion6 = value;

  @observable
  double question7 = 0;
  @action
  changeQuestion7(double value) => question7 = value;
  @observable
  String textQuestion7 = "Incerto";
  @action
  void changeTextQ7(String value) => textQuestion7 = value;

  @observable
  double question8 = 0;
  @action
  changeQuestion8(double value) => question8 = value;
  @observable
  String textQuestion8 = "Incerto";
  @action
  void changeTextQ8(String value) => textQuestion8 = value;

  @observable
  double question9 = 0;
  @action
  changeQuestion9(double value) => question9 = value;
  @observable
  String textQuestion9 = "Incerto";
  @action
  void changeTextQ9(String value) => textQuestion9 = value;

  @observable
  double question10 = 0;
  @action
  changeQuestion10(double value) => question10 = value;
  @observable
  String textQuestion10 = "Incerto";
  @action
  void changeTextQ10(String value) => textQuestion10 = value;
}
