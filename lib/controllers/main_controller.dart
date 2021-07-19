import 'package:mobx/mobx.dart';

// Include generated file
part 'main_controller.g.dart';

// This is the class used by rest of your codebase
class MainController = _MainController with _$MainController;

// The store-class
abstract class _MainController with Store {
 
  @observable
  String name;

  @observable 
  bool searchComplete;

  @observable 
  bool chapter1Complete;

  @observable 
  bool chapter2Complete;

  @observable 
  bool chapter3Complete;

  @observable 
  bool chapter4Complete;

  
}
