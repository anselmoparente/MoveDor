import 'package:cloud_firestore/cloud_firestore.dart';
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
  int lastChapter = 0;

  @observable
  String id;

  @observable
  bool finishedQuiz = false;

  @observable
  bool finishedQuestions = false;

  @action
  Future<void> getMain() async {
    DocumentSnapshot variable = await Firestore.instance
        .collection('users')
        .doc('ruMDKcF5Ob3lJLABj71f')
        .get();

    print(variable);
  }
}
