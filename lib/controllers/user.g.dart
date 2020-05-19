// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on UserControllerBase, Store {
  Computed<ESTADOLOGIN> _$getEstadoLoginComputed;

  @override
  ESTADOLOGIN get getEstadoLogin => (_$getEstadoLoginComputed ??=
          Computed<ESTADOLOGIN>(() => super.getEstadoLogin,
              name: 'UserControllerBase.getEstadoLogin'))
      .value;
  Computed<ESTADOCRIARUSUARIO> _$getEstadoCriarUsuarioComputed;

  @override
  ESTADOCRIARUSUARIO get getEstadoCriarUsuario =>
      (_$getEstadoCriarUsuarioComputed ??= Computed<ESTADOCRIARUSUARIO>(
              () => super.getEstadoCriarUsuario,
              name: 'UserControllerBase.getEstadoCriarUsuario'))
          .value;

  final _$estadologinAtom = Atom(name: 'UserControllerBase.estadologin');

  @override
  ESTADOLOGIN get estadologin {
    _$estadologinAtom.reportRead();
    return super.estadologin;
  }

  @override
  set estadologin(ESTADOLOGIN value) {
    _$estadologinAtom.reportWrite(value, super.estadologin, () {
      super.estadologin = value;
    });
  }

  final _$estadocriarusuarioAtom =
      Atom(name: 'UserControllerBase.estadocriarusuario');

  @override
  ESTADOCRIARUSUARIO get estadocriarusuario {
    _$estadocriarusuarioAtom.reportRead();
    return super.estadocriarusuario;
  }

  @override
  set estadocriarusuario(ESTADOCRIARUSUARIO value) {
    _$estadocriarusuarioAtom.reportWrite(value, super.estadocriarusuario, () {
      super.estadocriarusuario = value;
    });
  }

  final _$UserControllerBaseActionController =
      ActionController(name: 'UserControllerBase');

  @override
  dynamic setEstadoLogin(ESTADOLOGIN estado) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setEstadoLogin');
    try {
      return super.setEstadoLogin(estado);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEstadoCriarUsuario(ESTADOCRIARUSUARIO estado) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setEstadoCriarUsuario');
    try {
      return super.setEstadoCriarUsuario(estado);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
estadologin: ${estadologin},
estadocriarusuario: ${estadocriarusuario},
getEstadoLogin: ${getEstadoLogin},
getEstadoCriarUsuario: ${getEstadoCriarUsuario}
    ''';
  }
}
