// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LanguageController on LanguageControllerBase, Store {
  Computed<Map<String, dynamic>> _$getidiomaComputed;

  @override
  Map<String, dynamic> get getidioma => (_$getidiomaComputed ??=
          Computed<Map<String, dynamic>>(() => super.getidioma,
              name: 'LanguageControllerBase.getidioma'))
      .value;

  final _$idiomaAtom = Atom(name: 'LanguageControllerBase.idioma');

  @override
  Map<String, dynamic> get idioma {
    _$idiomaAtom.reportRead();
    return super.idioma;
  }

  @override
  set idioma(Map<String, dynamic> value) {
    _$idiomaAtom.reportWrite(value, super.idioma, () {
      super.idioma = value;
    });
  }

  final _$LanguageControllerBaseActionController =
      ActionController(name: 'LanguageControllerBase');

  @override
  dynamic setIdioma(Map<String, dynamic> novoIdioma) {
    final _$actionInfo = _$LanguageControllerBaseActionController.startAction(
        name: 'LanguageControllerBase.setIdioma');
    try {
      return super.setIdioma(novoIdioma);
    } finally {
      _$LanguageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idioma: ${idioma},
getidioma: ${getidioma}
    ''';
  }
}
