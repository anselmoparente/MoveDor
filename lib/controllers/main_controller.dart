import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'main_controller.g.dart';

// This is the class used by rest of your codebase
class MainController = _MainController with _$MainController;

// The store-class
abstract class _MainController with Store {
  _MainController() {
    identification();
  }
  @observable
  String name = '';

  @observable
  String token = '';

  @observable
  bool first = false;

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
    FirebaseFirestore.instance
        .collection('users_v2')
        .doc(id)
        .get()
        .then((value) {
      name = value['name'];
      searchComplete = value['search']['search_complete'];
      lastChapter = value['book']['last_chapter'];
      finishedQuestions = value['book']['questions'];
    });
  }

  void identification() async {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    id = androidInfo.androidId;
  }
}
