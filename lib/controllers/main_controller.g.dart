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

  final _$feelPainAtom = Atom(name: '_MainController.feelPain');

  @override
  bool get feelPain {
    _$feelPainAtom.reportRead();
    return super.feelPain;
  }

  @override
  set feelPain(bool value) {
    _$feelPainAtom.reportWrite(value, super.feelPain, () {
      super.feelPain = value;
    });
  }

  final _$painSupAtom = Atom(name: '_MainController.painSup');

  @override
  bool get painSup {
    _$painSupAtom.reportRead();
    return super.painSup;
  }

  @override
  set painSup(bool value) {
    _$painSupAtom.reportWrite(value, super.painSup, () {
      super.painSup = value;
    });
  }

  final _$painInfAtom = Atom(name: '_MainController.painInf');

  @override
  bool get painInf {
    _$painInfAtom.reportRead();
    return super.painInf;
  }

  @override
  set painInf(bool value) {
    _$painInfAtom.reportWrite(value, super.painInf, () {
      super.painInf = value;
    });
  }

  final _$timeDorAtom = Atom(name: '_MainController.timeDor');

  @override
  String get timeDor {
    _$timeDorAtom.reportRead();
    return super.timeDor;
  }

  @override
  set timeDor(String value) {
    _$timeDorAtom.reportWrite(value, super.timeDor, () {
      super.timeDor = value;
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
  void changeFeelPain(bool value) {
    final _$actionInfo = _$_MainControllerActionController.startAction(
        name: '_MainController.changeFeelPain');
    try {
      return super.changeFeelPain(value);
    } finally {
      _$_MainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePainSup(bool value) {
    final _$actionInfo = _$_MainControllerActionController.startAction(
        name: '_MainController.changePainSup');
    try {
      return super.changePainSup(value);
    } finally {
      _$_MainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePainInf(bool value) {
    final _$actionInfo = _$_MainControllerActionController.startAction(
        name: '_MainController.changePainInf');
    try {
      return super.changePainInf(value);
    } finally {
      _$_MainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTimeDor(String value) {
    final _$actionInfo = _$_MainControllerActionController.startAction(
        name: '_MainController.changeTimeDor');
    try {
      return super.changeTimeDor(value);
    } finally {
      _$_MainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
medication: ${medication},
feelPain: ${feelPain},
painSup: ${painSup},
painInf: ${painInf},
timeDor: ${timeDor},
nameMedications: ${nameMedications}
    ''';
  }
}
