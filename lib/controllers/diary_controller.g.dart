// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DiaryController on _DiaryController, Store {
  final _$actualDayAtom = Atom(name: '_DiaryController.actualDay');

  @override
  DateTime get actualDay {
    _$actualDayAtom.reportRead();
    return super.actualDay;
  }

  @override
  set actualDay(DateTime value) {
    _$actualDayAtom.reportWrite(value, super.actualDay, () {
      super.actualDay = value;
    });
  }

  final _$selectedDayAtom = Atom(name: '_DiaryController.selectedDay');

  @override
  DateTime get selectedDay {
    _$selectedDayAtom.reportRead();
    return super.selectedDay;
  }

  @override
  set selectedDay(DateTime value) {
    _$selectedDayAtom.reportWrite(value, super.selectedDay, () {
      super.selectedDay = value;
    });
  }

  final _$doneActivityAtom = Atom(name: '_DiaryController.doneActivity');

  @override
  bool get doneActivity {
    _$doneActivityAtom.reportRead();
    return super.doneActivity;
  }

  @override
  set doneActivity(bool value) {
    _$doneActivityAtom.reportWrite(value, super.doneActivity, () {
      super.doneActivity = value;
    });
  }

  final _$valueBorgAtom = Atom(name: '_DiaryController.valueBorg');

  @override
  double get valueBorg {
    _$valueBorgAtom.reportRead();
    return super.valueBorg;
  }

  @override
  set valueBorg(double value) {
    _$valueBorgAtom.reportWrite(value, super.valueBorg, () {
      super.valueBorg = value;
    });
  }

  final _$_DiaryControllerActionController =
      ActionController(name: '_DiaryController');

  @override
  void changeActualDay(DateTime value) {
    final _$actionInfo = _$_DiaryControllerActionController.startAction(
        name: '_DiaryController.changeActualDay');
    try {
      return super.changeActualDay(value);
    } finally {
      _$_DiaryControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedDay(DateTime value) {
    final _$actionInfo = _$_DiaryControllerActionController.startAction(
        name: '_DiaryController.changeSelectedDay');
    try {
      return super.changeSelectedDay(value);
    } finally {
      _$_DiaryControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeValueBorg(double value) {
    final _$actionInfo = _$_DiaryControllerActionController.startAction(
        name: '_DiaryController.changeValueBorg');
    try {
      return super.changeValueBorg(value);
    } finally {
      _$_DiaryControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actualDay: ${actualDay},
selectedDay: ${selectedDay},
doneActivity: ${doneActivity},
valueBorg: ${valueBorg}
    ''';
  }
}
