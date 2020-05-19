// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserModel on UserModelBase, Store {
  Computed<String> _$getUidComputed;

  @override
  String get getUid => (_$getUidComputed ??=
          Computed<String>(() => super.getUid, name: 'UserModelBase.getUid'))
      .value;
  Computed<String> _$getNomeComputed;

  @override
  String get getNome => (_$getNomeComputed ??=
          Computed<String>(() => super.getNome, name: 'UserModelBase.getNome'))
      .value;
  Computed<String> _$getEmailComputed;

  @override
  String get getEmail =>
      (_$getEmailComputed ??= Computed<String>(() => super.getEmail,
              name: 'UserModelBase.getEmail'))
          .value;

  final _$uidAtom = Atom(name: 'UserModelBase.uid');

  @override
  String get uid {
    _$uidAtom.reportRead();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.reportWrite(value, super.uid, () {
      super.uid = value;
    });
  }

  final _$nomeAtom = Atom(name: 'UserModelBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$emailAtom = Atom(name: 'UserModelBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: 'UserModelBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$UserModelBaseActionController =
      ActionController(name: 'UserModelBase');

  @override
  dynamic setUid(String id) {
    final _$actionInfo = _$UserModelBaseActionController.startAction(
        name: 'UserModelBase.setUid');
    try {
      return super.setUid(id);
    } finally {
      _$UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNome(String novoNome) {
    final _$actionInfo = _$UserModelBaseActionController.startAction(
        name: 'UserModelBase.setNome');
    try {
      return super.setNome(novoNome);
    } finally {
      _$UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
uid: ${uid},
nome: ${nome},
email: ${email},
senha: ${senha},
getUid: ${getUid},
getNome: ${getNome},
getEmail: ${getEmail}
    ''';
  }
}
