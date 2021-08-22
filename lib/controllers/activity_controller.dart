import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:movedor/models/activities.dart';
import 'package:movedor/models/activity_planed.dart';

// Include generated file
part 'activity_controller.g.dart';

// This is the class used by rest of your codebase
class ActivityController = _ActivityController with _$ActivityController;

// The store-class
abstract class _ActivityController with Store {
  ObservableList<ActivityPlaned> activitiesPlaned =
      ObservableList<ActivityPlaned>();

  ObservableList<Activities> activities = ObservableList<Activities>();

  ObservableList<Activities> activitiesCalendar = ObservableList<Activities>();

  
}
