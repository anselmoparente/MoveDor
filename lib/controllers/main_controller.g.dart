// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainController on _MainController, Store {
  final _$nameAtom = Atom(name: '_MainController.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$tokenAtom = Atom(name: '_MainController.token');

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$firstAtom = Atom(name: '_MainController.first');

  @override
  bool get first {
    _$firstAtom.reportRead();
    return super.first;
  }

  @override
  set first(bool value) {
    _$firstAtom.reportWrite(value, super.first, () {
      super.first = value;
    });
  }

  final _$searchCompleteAtom = Atom(name: '_MainController.searchComplete');

  @override
  bool get searchComplete {
    _$searchCompleteAtom.reportRead();
    return super.searchComplete;
  }

  @override
  set searchComplete(bool value) {
    _$searchCompleteAtom.reportWrite(value, super.searchComplete, () {
      super.searchComplete = value;
    });
  }

  final _$lastChapterAtom = Atom(name: '_MainController.lastChapter');

  @override
  int get lastChapter {
    _$lastChapterAtom.reportRead();
    return super.lastChapter;
  }

  @override
  set lastChapter(int value) {
    _$lastChapterAtom.reportWrite(value, super.lastChapter, () {
      super.lastChapter = value;
    });
  }

  final _$idAtom = Atom(name: '_MainController.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$finishedQuizAtom = Atom(name: '_MainController.finishedQuiz');

  @override
  bool get finishedQuiz {
    _$finishedQuizAtom.reportRead();
    return super.finishedQuiz;
  }

  @override
  set finishedQuiz(bool value) {
    _$finishedQuizAtom.reportWrite(value, super.finishedQuiz, () {
      super.finishedQuiz = value;
    });
  }

  final _$finishedQuestionsAtom =
      Atom(name: '_MainController.finishedQuestions');

  @override
  bool get finishedQuestions {
    _$finishedQuestionsAtom.reportRead();
    return super.finishedQuestions;
  }

  @override
  set finishedQuestions(bool value) {
    _$finishedQuestionsAtom.reportWrite(value, super.finishedQuestions, () {
      super.finishedQuestions = value;
    });
  }

  final _$getMainAsyncAction = AsyncAction('_MainController.getMain');

  @override
  Future<void> getMain() {
    return _$getMainAsyncAction.run(() => super.getMain());
  }

  @override
  String toString() {
    return '''
name: ${name},
token: ${token},
first: ${first},
searchComplete: ${searchComplete},
lastChapter: ${lastChapter},
id: ${id},
finishedQuiz: ${finishedQuiz},
finishedQuestions: ${finishedQuestions}
    ''';
  }
}
