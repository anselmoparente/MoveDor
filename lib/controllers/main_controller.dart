import 'package:mobx/mobx.dart';

// Include generated file
part 'main_controller.g.dart';

// This is the class used by rest of your codebase
class MainController = _MainController with _$MainController;

// The store-class
abstract class _MainController with Store {
 
  @observable
  String name = '';

  @observable 
  bool searchComplete = false;

  @observable 
  bool chapter1Complete = false;

  @observable 
  bool chapter2Complete = false;

  @observable 
  bool chapter3Complete = false;

  @observable 
  bool chapter4Complete = false;

  @observable
  bool configuredDiary = false;
}
