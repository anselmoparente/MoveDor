import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'diary_controller.g.dart';

// This is the class used by rest of your codebase
class DiaryController = _DiaryController with _$DiaryController;

// The store-class
abstract class _DiaryController with Store {
  @observable
  bool configuredDiary = false;

  // Atividades pretendidas
  ObservableList<String> activities = ObservableList<String>();

  // Tempo médio das atividades
  ObservableList<String> activityTime = ObservableList<String>();

  // Auxiliar do tempo médio das atividades
  ObservableList<double> activityTimeAux = ObservableList<double>();

  // Período da atividade
  ObservableList<String> activityPeriod = ObservableList<String>();

  // Auxiliar do período da atividade
  ObservableList<double> activityPeriodAux = ObservableList<double>();

  // Dias marcados com atividades
  ObservableList<String> activitysDays = ObservableList<String>();

  // Dias marcados com atividades
  ObservableList<List<String>> activitysDaysTest =
      ObservableList<List<String>>();

  @observable
  DateTime actualDay;

  @observable
  DateTime selectedDay;

  @action
  void changeActualDay(DateTime value) => actualDay = value;

  @action
  void changeSelectedDay(DateTime value) => selectedDay = value;

  @observable
  bool doneActivity;

  @observable
  double valueBorg = 5.0;

  @action
  void changeValueBorg(double value) => valueBorg = value;

  @action
  Future<void> getDiary(String id) async {
    FirebaseFirestore.instance.collection('users_v2').doc(id).get().then((value) {
      configuredDiary = value['configured_diary'];
    });
  }
}
