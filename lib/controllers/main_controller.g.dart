// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainController on _MainController, Store {
  final _$medicationAtom = Atom(name: '_MainController.medication');

  @override
  bool get medication {
    _$medicationAtom.reportRead();
    return super.medication;
  }

  @override
  set medication(bool value) {
    _$medicationAtom.reportWrite(value, super.medication, () {
      super.medication = value;
    });
  }

  final _$nameMedicationsAtom = Atom(name: '_MainController.nameMedications');

  @override
  String get nameMedications {
    _$nameMedicationsAtom.reportRead();
    return super.nameMedications;
  }

  @override
  set nameMedications(String value) {
    _$nameMedicationsAtom.reportWrite(value, super.nameMedications, () {
      super.nameMedications = value;
    });
  }

  final _$_MainControllerActionController =
      ActionController(name: '_MainController');

  @override
  void changedMedication(bool value) {
    final _$actionInfo = _$_MainControllerActionController.startAction(
        name: '_MainController.changedMedication');
    try {
      return super.changedMedication(value);
    } finally {
      _$_MainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
medication: ${medication},
nameMedications: ${nameMedications}
    ''';
  }
}
