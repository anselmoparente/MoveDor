import 'package:mobx/mobx.dart';

// Include generated file
part 'diary_controller.g.dart';

// This is the class used by rest of your codebase
class DiaryController = _DiaryController with _$DiaryController;

// The store-class
abstract class _DiaryController with Store {

  // Atividades pretendidas
  ObservableList<String> activities = ObservableList<String>();

  // Tempo médio de atividade
  @observable
  String activityTime;
  
  @action
  void changedActivityTime(String value) => activityTime = value;
  
  // Período da atividade
  @observable
  String activityPeriod;
  @action
  void changedActivityPeriod(String value) => activityPeriod = value;

  // Dias marcados com atividades
  ObservableList<String> activitysDays = ObservableList<String>();

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
}
